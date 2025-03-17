# eksctl

- [Docs](https://eksctl.io)
- [GitHub Repo](https://github.com/eksctl-io/eksctl)

### Create a Cluster

```
eksctl create cluster \
	--name <clusterName> \
	--region eu-central-1 \
	--nodegroup-name <nodegroupName> \
	--node-type t2.micro --nodes 2
```

### Delete a Nodegroup

```
eksctl delete nodegroup \
	--cluster <clusterName> \
	--name <nodegroupName>
```

### Delete Cluster

```
eksctl delete cluster \
	--name <clusterName>
```

# Resources

- https://youtu.be/p6xDCz00TxU
- https://youtu.be/7wRqtBMS6E0
- https://github.com/terraform-aws-modules/terraform-aws-eks
- https://github.com/awslabs/amazon-eks-ami/blob/main/templates/shared/runtime/eni-max-pods.txt

- https://aws.amazon.com/blogs/storage/persistent-storage-for-kubernetes/
- https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html
- [Store an elastic file system with Amazon EFS](https://docs.aws.amazon.com/eks/latest/userguide/efs-csi.html)
- https://github.com/kubernetes-sigs/aws-efs-csi-driver/blob/master/docs/efs-create-filesystem.md

- Dynamic Provisioning: https://github.com/kubernetes-sigs/aws-efs-csi-driver/tree/master/examples/kubernetes/dynamic_provisioning

- https://blog.cloudtechner.com/setting-up-efs-as-persistent-volume-for-aws-eks-d16f5f46951e

- [Node Autoscaling with Karpenter](https://medium.com/@ahil.matheww/provisioning-aws-karpenter-provisioners-with-terraform-1cade400c104)

---

Create the Cluster
```
 eksctl create cluster \
	 --name ssp-benchmark \
	 --region eu-central-1 \
	 --node-type t3.small \
	 --nodes-min 2 \
	 --nodes-max 10 \
	 --managed \
	 --version 1.32
```

Add OIDC Provider
```
eksctl utils associate-iam-oidc-provider --cluster ssp-benchmark --approve
```

Create the IAM Role
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::445324578130:oidc-provider/oidc.eks.eu-central-1.amazonaws.com/id/2E037B6ACF5528B3137689C725F3AE9F"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.eu-central-1.amazonaws.com/id/2E037B6ACF5528B3137689C725F3AE9F:aud": "sts.amazonaws.com",
          "oidc.eks.eu-central-1.amazonaws.com/id/2E037B6ACF5528B3137689C725F3AE9F:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
        }
      }
    }
  ]
}
```
```
aws iam create-role --role-name AmazonEKS_EBS_CSI_DriverRole --assume-role-policy-document file://trust-policy.json
```

Attach role policy
```
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy --role-name AmazonEKS_EBS_CSI_DriverRole
```

Attach CSI driver
```
aws eks create-addon --cluster-name ssp-benchmark --addon-name aws-ebs-csi-driver --service-account-role-arn arn:aws:iam::445324578130:role/AmazonEKS_EBS_CSI_DriverRole
```
# Setup k6-operator via helm

```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install k6-operator grafana/k6-operator
```


# EKS

1. Create EKS Cluster
2. Create EFS Storage
3. [Add EBS CSI Addon](https://docs.aws.amazon.com/eks/latest/userguide/creating-an-add-on.html#_create_add_on_console)
4. [Add EBS Role](https://docs.aws.amazon.com/eks/latest/userguide/ebs-csi.html#managing-ebs-csi)

See: https://stackoverflow.com/questions/75758115/persistentvolumeclaim-is-stuck-waiting-for-a-volume-to-be-created-either-by-ex
# Resources
- https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/usage/executing-k6-scripts-with-testrun-crd/
- https://github.com/grafana/k6-example-data-generation/blob/main/src/index.js
- https://grafana.com/blog/2023/04/11/how-to-visualize-load-testing-results/
- https://grafana.com/blog/2022/06/23/running-distributed-load-tests-on-kubernetes/#metrics-will-not-be-automatically-aggregated-by-default
- https://grafana.com/docs/k6/latest/testing-guides/running-distributed-tests/
- https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/

- AWS EKS Storage Setup: https://aws.amazon.com/blogs/storage/persistent-storage-for-kubernetes/

- Grafana Dashboard: https://grafana.com/grafana/dashboards/19665-k6-prometheus/

- Carry cookies over from setup to tests: https://github.com/grafana/k6-docs/issues/199


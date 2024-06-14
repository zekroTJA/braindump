It is possible to set a `start` and `end` value for battery charging percentages to preserve battery longevity.

```
echo "75" | sudo tee /sys/class/power_supply/BAT0/charge_control_start_threshold
echo "85" | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
```

These commands set the “start” threshold — the battery percentage from which the battery will be charged when reached after dropping down — to 75% and the “end” threshold — the battery percentage when the charging will be stopped — to 85%.

Alternatively, if this does not work, you might need to replace `BAT0` with `BAT1`, if your device reports more than one battery.

# Sources

- [https://www.summet.com/blog/2021/06/07/enabling-a-maximum-battery-charge-amount-charge-threshold-on-lenovo-x1-in-ubuntu/](https://www.summet.com/blog/2021/06/07/enabling-a-maximum-battery-charge-amount-charge-threshold-on-lenovo-x1-in-ubuntu/)
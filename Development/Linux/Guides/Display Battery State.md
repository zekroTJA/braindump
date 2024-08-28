The Tool `upower` can be used to display information like battery charge state, charge cycles or capacity of your systems battery.

## List all available Batteries

```bash
upower -e
```

*Example output:*
```
/org/freedesktop/UPower/devices/battery_BAT0
/org/freedesktop/UPower/devices/line_power_AC
/org/freedesktop/UPower/devices/battery_hidpp_battery_0
/org/freedesktop/UPower/devices/DisplayDevice
```
## Display information about a battery

```bash
upower -i /org/freedesktop/UPower/devices/battery_BAT0
```

*Example output:*
```
native-path:          BAT0
  vendor:               Sunwoda
  model:                5B10W51816
  serial:               10345
  power supply:         yes
  updated:              Wed 28 Aug 2024 11:27:21 AM CEST (21 seconds ago)
  has history:          yes
  has statistics:       yes
  battery
    present:             yes
    rechargeable:        yes
    state:               fully-charged
    warning-level:       none
    energy:              56.88 Wh
    energy-empty:        0 Wh
    energy-full:         56.99 Wh
    energy-full-design:  57 Wh
    energy-rate:         0 W
    voltage:             17.288 V
    charge-cycles:       157
    percentage:          99%
    capacity:            99.9825%
    technology:          lithium-polymer
    icon-name:          'battery-full-charged-symbolic'
```

---

This can also be combined into a single command:
```bash
upower -i $(upower -e | head -1)
```

## Sources

- https://www.cyberciti.biz/faq/linux-upower-command-examples-and-syntax/
- https://www.cyberciti.biz/faq/check-see-laptop-battery-health-in-linux-command/
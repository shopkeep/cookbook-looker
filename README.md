# looker-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

Ubuntu 12.04, 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['looker']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### looker::default

Include `looker` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[looker::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)

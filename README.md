# looker-cookbook

Cookbook to automate the installation of looker on-premise as per official documentation provided
by looker found [here](http://www.looker.com/docs/admin/on-premise/installation).

## Supported Platforms

Ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['looker']['home']</tt></td>
    <td>String</td>
    <td>The looker user's home directory</td>
    <td><tt>'/home/looker'</tt></td>
  </tr>
  <tr>
    <td><tt>['looker']['startup_script_url']</tt></td>
    <td>String</td>
    <td>http(s) url to download looker's startup script from. This attribute is required.</td>
    <td><tt>''</td></tt>
  </tr>
  <tr>
    <td><tt>['looker']['jar_file_url']</tt></td>
    <td>String</td>
    <td>http(s) url to download looker's jar file from. This attribute is required.</td>
    <td><tt>''</td></tt>
  </tr>
  <tr>
    <td><tt>['looker']['LOOKERARGS']</tt></td>
    <td>String</td>
    <td>LOOKERARGS in ['looker']['home']/looker/lookerstart.cfg</td>
    <td><tt>''</td></tt>
  </tr>
  <tr>
    <td><tt>['looker']['JAVAARGS']</tt></td>
    <td>String</td>
    <td>JAVAARGS in ['looker']['home']/looker/lookerstart.cfg</td>
    <td><tt>''</td></tt>
  </tr>
  <tr>
    <td><tt>['java']['oracle']['accept_oracle_download_terms']</tt></td>
    <td>Boolean</td>
    <td>Looker requires Oracle Java, do you accept the terms?</td>
    <td><tt>true</td></tt>
  </tr>
</table>

## Usage

**NOTE:** **node['looker']['startup_script_url']** and **node['looker']['jar_file_url']** must be set in order for this cookbook to run.

### looker::default

Include `looker` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[looker::default]"
  ]
}
```

## Testing

**NOTE**: Ensure to override node['looker']['startup_script_url'] and node['looker']['jar_file_url'] via environment or via .kitchen.local.yml. If you are unsure of the URL's to use please speak to your looker account rep.

```ruby
bundle install

# Rubocop, Foodcritic, Chefspec
bundle exec rake

# Test Kitchen
bundle exec kitchen test
```

## License and Authors

Author:: James Awesome (awesome@shopkeep.com)

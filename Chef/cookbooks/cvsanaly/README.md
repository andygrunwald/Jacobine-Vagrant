cvsanaly Cookbook
==========================
Installs [CVSAnalY](https://github.com/MetricsGrimoire/CVSAnalY).

The CVSAnalY tool extracts information out of source code repository logs and stores it into a database.

If you want to try out CVSAnalY you can use the example [Vagrant setup for MetricsGrimoire toolset](https://github.com/andygrunwald/Vagrant-MetricsGrimoire).

Requirements
------------

* CVS / SVN / Git client (depends on your needs)
* MySQL / SQLite (depends on your needs)

#### Packages
- `repositoryhandler`

Attributes
----------
#### cvsanaly::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:cvsanaly][:repository]</tt></td>
    <td>String</td>
    <td>Git-Repository / Source of CVSAnalY</td>
    <td><tt>https://github.com/MetricsGrimoire/CVSAnalY.git</tt></td>
  </tr>
  <tr>
    <td><tt>[:cvsanaly][:version]</tt></td>
    <td>String</td>
    <td>Branch / Tag which will be installed</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>[:cvsanaly][:destination]</tt></td>
    <td>String</td>
    <td>Path where :repository will be cloned</td>
    <td><tt>/vagrant/MetricsGrimoire/CVSAnalY</tt></td>
  </tr>
  <tr>
    <td><tt>[:cvsanaly][:owner]</tt></td>
    <td>String</td>
    <td>Owner of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:cvsanaly][:group]</tt></td>
    <td>String</td>
    <td>Group of :destination</td>
    <td><tt>root</tt></td>
  </tr>
</table>

Usage
-----
#### cvsanaly::default

Just include `cvsanaly` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cvsanaly]"
  ]
}
```

License
------------
This code is released under the terms of the [Apache License in version 2.0](http://www.apache.org/licenses/LICENSE-2.0).


Contributing
------------
1. Fork and clone it (`git clone https://github.com/andygrunwald/chef-cvsanaly.git`)
2. Create a named feature branch (`git checkout -b my-new-feature`)
3. Write you change (hack hack hack)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Submit a [Pull Request using Github](https://help.github.com/articles/creating-a-pull-request)

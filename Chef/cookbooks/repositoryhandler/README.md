repositoryhandler Cookbook
==========================
Installs the python library [RepositoryHandler](https://github.com/MetricsGrimoire/RepositoryHandler).

RepositoryHandler is a python library for handling code repositories through a common interface.

This cookbook will be used by the [Chef cookbook for CVSAnaly](https://github.com/andygrunwald/chef-cvsanaly).
If you want to try out this library you can use the example [Vagrant setup for MetricsGrimoire toolset](https://github.com/andygrunwald/Vagrant-MetricsGrimoire).

Requirements
------------

 * CVS / SVN / Git / Bazaar client (depends on your needs)

#### Packages
- `python` >= 2.4
- `git`

Attributes
----------
#### repositoryhandler::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:repositoryhandler][:repository]</tt></td>
    <td>String</td>
    <td>Git-Repository / Source of RepositoryHandler</td>
    <td><tt>https://github.com/MetricsGrimoire/RepositoryHandler.git</tt></td>
  </tr>
  <tr>
    <td><tt>[:repositoryhandler][:version]</tt></td>
    <td>String</td>
    <td>Branch / Tag which will be installed</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>[:repositoryhandler][:destination]</tt></td>
    <td>String</td>
    <td>Path where :repository will be cloned</td>
    <td><tt>/vagrant/MetricsGrimoire/RepositoryHandler</tt></td>
  </tr>
  <tr>
    <td><tt>[:repositoryhandler][:owner]</tt></td>
    <td>String</td>
    <td>Owner of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:repositoryhandler][:group]</tt></td>
    <td>String</td>
    <td>Group of :destination</td>
    <td><tt>root</tt></td>
  </tr>
</table>

Usage
-----
#### repositoryhandler::default

Just include `repositoryhandler` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[repositoryhandler]"
  ]
}
```

License
------------
This code is released under the terms of the [Apache License in version 2.0](http://www.apache.org/licenses/LICENSE-2.0).


Contributing
------------
1. Fork and clone it (`git clone https://github.com/andygrunwald/chef-repositoryhandler.git`)
2. Create a named feature branch (`git checkout -b my-new-feature`)
3. Write you change (hack hack hack)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Submit a [Pull Request using Github](https://help.github.com/articles/creating-a-pull-request)

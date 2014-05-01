github-linguist Cookbook
========================

Installs [github/linguist](https://github.com/github/linguist/) for you.

Requirements
------------

#### packages
- `rubygems`
- `git`

Attributes
----------
#### linguist::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:linguist][:install_method]</tt></td>
    <td>String</td>
    <td>Installation method: <tt>gem</tt> for latest stable or <tt>source</tt> to install from source</td>
    <td><tt>gem</tt></td>
  </tr>
  <tr>
    <td><tt>[:linguist][:repository]</tt></td>
    <td>String</td>
    <td>Git-Repository / Source of github linguist</td>
    <td><tt>https://github.com/github/linguist.git</tt></td>
  </tr>
  <tr>
    <td><tt>[:linguist][:branch]</tt></td>
    <td>String</td>
    <td>Branch / Tag which will be installed</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>[:linguist][:path]</tt></td>
    <td>String</td>
    <td>Path where :repository will be cloned</td>
    <td><tt>/var/application</tt></td>
  </tr>
  <tr>
    <td><tt>[:linguist][:owner]</tt></td>
    <td>String</td>
    <td>Owner of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:linguist][:group]</tt></td>
    <td>String</td>
    <td>Group of :destination</td>
    <td><tt>root</tt></td>
  </tr>
</table>

Usage
-----
#### github-linguist::default

Just include `github-linguist` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[github-linguist]"
  ]
}
```

License
------------
This code is released under the terms of the [Apache License in version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

Contributing
------------
1. Fork and clone it (`git clone https://github.com/andygrunwald/chef-github-linguist.git`)
2. Create a named feature branch (`git checkout -b my-new-feature`)
3. Write you change (hack hack hack)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Submit a [Pull Request using Github](https://help.github.com/articles/creating-a-pull-request)

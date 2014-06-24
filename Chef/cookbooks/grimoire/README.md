grimoire Cookbook
==========================
Installs/Configures tools from *Grimoire (e.g. [MetricsGrimoire](https://github.com/MetricsGrimoire/) or [VizGrimoire](https://github.com/VizGrimoire/)) .

Supported tools:
* [Mailing List Stats](https://github.com/MetricsGrimoire/MailingListStats)
* [RepositoryHandler](https://github.com/MetricsGrimoire/RepositoryHandler)
* [CVSAnalY](https://github.com/MetricsGrimoire/CVSAnalY)

If you want to try out Mailing List Stats or CVSAnalY you can use the example [Vagrant setup for MetricsGrimoire toolset](https://github.com/andygrunwald/Vagrant-MetricsGrimoire).

Requirements
------------

#### Databases
Depends on your needs which storage backend you prefer.
Database server itselfs will not be installed, but is necessary if you want to use a tool from the [MetricsGrimoire](https://github.com/MetricsGrimoire/) toolset.
Please have a detailled look at the used tool itselfs to identify which storage backends are supported.

* MySQL
* SQLite
* PostreSQL

#### Cookbooks
- `git`
- `subversion`
- `python`

Attributes
----------
#### grimoire::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:grimoire][:mlstats][:repository]</tt></td>
    <td>String</td>
    <td>Git-Repository / Source of Mailing List Stats</td>
    <td><tt>https://github.com/MetricsGrimoire/MailingListStats.git</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:mlstats][:version]</tt></td>
    <td>String</td>
    <td>Branch / Tag which will be installed</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:mlstats][:destination]</tt></td>
    <td>String</td>
    <td>Path where :repository will be cloned</td>
    <td><tt>/tmp/MetricsGrimoire/mlstats</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:mlstats][:owner]</tt></td>
    <td>String</td>
    <td>Owner of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:mlstats][:group]</tt></td>
    <td>String</td>
    <td>Group of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:repositoryhandler][:repository]</tt></td>
    <td>String</td>
    <td>Git-Repository / Source of RepositoryHandler</td>
    <td><tt>https://github.com/MetricsGrimoire/RepositoryHandler.git</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:repositoryhandler][:version]</tt></td>
    <td>String</td>
    <td>Branch / Tag which will be installed</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:repositoryhandler][:destination]</tt></td>
    <td>String</td>
    <td>Path where :repository will be cloned</td>
    <td><tt>/tmp/MetricsGrimoire/RepositoryHandler</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:repositoryhandler][:owner]</tt></td>
    <td>String</td>
    <td>Owner of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:repositoryhandler][:group]</tt></td>
    <td>String</td>
    <td>Group of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:cvsanaly][:repository]</tt></td>
    <td>String</td>
    <td>Git-Repository / Source of CVSAnalY</td>
    <td><tt>https://github.com/MetricsGrimoire/CVSAnalY.git</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:cvsanaly][:version]</tt></td>
    <td>String</td>
    <td>Branch / Tag which will be installed</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:cvsanaly][:destination]</tt></td>
    <td>String</td>
    <td>Path where :repository will be cloned</td>
    <td><tt>/tmp/MetricsGrimoire/CVSAnalY</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:cvsanaly][:owner]</tt></td>
    <td>String</td>
    <td>Owner of :destination</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>[:grimoire][:cvsanaly][:group]</tt></td>
    <td>String</td>
    <td>Group of :destination</td>
    <td><tt>root</tt></td>
  </tr>
</table>

Usage
-----
#### grimoire::default

The default recipe is empty.
Please include the recipe of the application you want to install.

### grimoire::mlstats

It will install [Mailing List Stats](https://github.com/MetricsGrimoire/MailingListStats).
Just include `grimoire::mlstats` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[grimoire::mlstats]"
  ]
}
```

### grimoire::repositoryhandler

It will install [RepositoryHandler](https://github.com/MetricsGrimoire/RepositoryHandler).
Just include `grimoire::repositoryhandler` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[grimoire::repositoryhandler]"
  ]
}
```

### grimoire::cvsanaly

It will install [CVSAnalY](https://github.com/MetricsGrimoire/CVSAnalY).
Just include `grimoire::repositoryhandler` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[grimoire::cvsanaly]"
  ]
}
```

License
------------
This code is released under the terms of the [Apache License in version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

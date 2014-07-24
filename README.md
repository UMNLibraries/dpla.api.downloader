A very simple script to download DPLA records from the DPLA API based on a set of queries listed in a `config.yml` file.


Example config file that downloads all recors with the subject heading "African Americans"
```
development:
  dpla_api_key: "<your key here>"
  queries:
   - '&sourceResource.subject=African%20Americans'
```
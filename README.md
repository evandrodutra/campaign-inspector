# Campaign Inspector

[![Build Status](https://travis-ci.org/evandrodutra/campaign-inspector.svg?branch=master)](https://travis-ci.org/evandrodutra/campaign-inspector)
[![Maintainability](https://api.codeclimate.com/v1/badges/4be044922da536614f7e/maintainability)](https://codeclimate.com/github/evandrodutra/campaign-inspector/maintainability)

Simple way to detect discrepancies between local and remote campaigns states.

## Requirements

- ruby 2.4.1
- bundler ~> 1.16

## Setup

Execute:
```bash
bin/setup
```

## Tests

Execute:
```bash
bundle exec rake spec
```

## Usage

Assuming that the local data are defined in `data/campaigns.yml`, there are two ways to execute the inspector:

### Executable

Execute:
```bash
bin/campaign_inspector
```
Returns:
```
[{:remote_reference=>"1",
  :discrepancies=>
   [{:description=>
      {:remote=>"Description for campaign 11",
       :local=>"Senior Ruby developer"}},
    {:status=>{:remote=>"enabled", :local=>"active"}}]},
 {:remote_reference=>"2",
  :discrepancies=>
   [{:description=>
      {:remote=>"Description for campaign 12", :local=>"Front-end developer"}},
    {:status=>{:remote=>"disabled", :local=>"paused"}}]},
 {:remote_reference=>"3",
  :discrepancies=>
   [{:description=>
      {:remote=>"Description for campaign 13", :local=>"Data engineer"}},
    {:status=>{:remote=>"enabled", :local=>"deleted"}}]}]
```

### Console

Execute:
```bash
bin/console
```
Example:
```bash
[1] pry(main)> remote_campaigns = CampaignInspector::GetCampaignsClient.call
=> [{:reference=>"1", :status=>"enabled", :description=>"Description for campaign 11"},
 {:reference=>"2", :status=>"disabled", :description=>"Description for campaign 12"},
 {:reference=>"3", :status=>"enabled", :description=>"Description for campaign 13"}]
[2] pry(main)> CampaignInspector.call(remote_campaigns: remote_campaigns)
=> [{:remote_reference=>"1", :discrepancies=>[{:description=>{:remote=>"Description for campaign 11", :local=>"Senior Ruby developer"}}, {:status=>{:remote=>"enabled", :local=>"active"}}]},
 {:remote_reference=>"2", :discrepancies=>[{:description=>{:remote=>"Description for campaign 12", :local=>"Front-end developer"}}, {:status=>{:remote=>"disabled", :local=>"paused"}}]},
 {:remote_reference=>"3", :discrepancies=>[{:description=>{:remote=>"Description for campaign 13", :local=>"Data engineer"}}, {:status=>{:remote=>"enabled", :local=>"deleted"}}]}]
```

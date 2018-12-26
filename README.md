# index page
A static web site for index


## how to add a category in nav bar

config.toml:
append some config in the toml:
```
[[ params.nav ]]
name = "collaborative"
tag = "collaborative"
icon = "star"

```

## how to add a website

data/links.yaml
append a website config:
```
-
  name: "google"
  url: "https://google.com"
  img: "logos/google.svg"
  tags: ["collaborative", "search"]

```
img support url or file in static/logos
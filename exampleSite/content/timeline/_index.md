---
title: Timeline
type: timeline
data: timeline.json
weight: 3
home: true
n_posts: 3
---

This is a timeline section, and is created with a json file that contains key information to create the cards. Keys in the json should be

`title`, `summary` and `url`, with optional `image` and `date` keys.

and example can look like this:

```json

[
  {
    "url": "https://drmowinckels.io/talks/slides/2023.10.03-ropensci-cli/",
    "title": "cli - Helpers for Developing Command Line Interfaces",
    "summary": "- rOpenSci co-working session -",
    "date": "2023.10.03",
    "image": null
  },
  {
    "url": "https://drmowinckels.io/talks/slides/2023.08.25-intpart-ggseg/",
    "title": "Visualizing brain data",
    "summary": "- Improving speed and flexibility of the ggseg-suite -",
    "date": "24.08.2023",
    "image": "https://raw.githubusercontent.com/drmowinckels/talks/main/slides/2023.08.25-intpart-ggseg/img/ggseg.png"
  }
]
```
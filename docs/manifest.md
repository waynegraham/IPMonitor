# IP Monitor

```json
{
  //Metadata about this manifest file
  "@context": "https://api.clir.org/grants/1/context.json",
  "@id": "https://www.example.edu/grants/grant##/manifest",
  "@type": "sc:Manifest",
  "@grant_id": "Grant Number",
  "@institution": "Foo",
  // Descriptive metadata about the object/work
  "label": "Recording 1",
  "metadata": [
    {"label": "Name", "value": "Object name"},
    {"label": "Source", "value": "<span>From: <a href=\"http://www.example.edu/db/1.html\">Some Collection</a></span>"}
  ],
  "derivative": {
    "@id": "https://www.example.edu/path/to/resource.mp4",
    "@checksum": "c53b9907999d92eabaf1a2004cac7cb6"
  }
}
```

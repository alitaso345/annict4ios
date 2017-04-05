# AnnictAPIClient.swift

## Get anime works

```
let client = AnnictClient(accessToken: 'accessToken')
let request = AnnictAPI.SearchWorks()

client.send(request: request) { result in
    switch result {
    case let .success(response):
        for work in response.works
            print(work.title)
    case let .failure(error):
        print(error)
    }
}
```

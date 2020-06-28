String allQuery =
    r'{"query":"{\n  viewer {\n    createdAt\n    repositories(last: 100, isFork: false) {\n      totalCount\n      repoEdges: edges {\n        repoNodes: node {\n          id\n          name\n          languages(first: 10) {\n            languageEdges: edges {\n              languageNode: node {\n                id\n                name\n              }\n            }\n          }\n          defaultBranchRef {\n            target {\n              ... on Commit {\n                history(first: 100) {\n                  totalCount\n                  commitEdges: edges {\n                    commitNode: node {\n                      messageHeadline\n                    }\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  }\n}\n"}';

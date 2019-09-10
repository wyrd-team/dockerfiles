開発に利用できる Dockerfile の管理リポジトリです.

[Docker Hub の autobuild](https://docs.docker.com/docker-hub/builds/)を利用しているため branch に命名規則をつけています.

## Setup

```sh
git clone git@github.com:wyrd-team/dockerfiles.git
cd dockerfiles
yarn install
yarn run info
```

git の branch の命名規則

## branch の命名規則

- `${ENV}-${ENV_VERSION}-${BASE_OS}-${VARIANT}`
  - **BAD** `anyenv`
  - **BAD** `anyenv-1.1.1`
  - **GOOD** `anyenv-latest-buster`
  - **GOOD** `anyenv-1.1.1-buster`
  - **GOOD** `anyenv-1.1.1-buster-node`
  - **GOOD** `anyenv-1.1.1-buster-node-10.16.3`

意味とフォーマット

- **`ENV`:** メインとなる環境名 (`-`を含まない文字)
- **`ENV_VERSION`:** メインとなる環境のバージョン (`-`を含まない文字)
- **`BASE_OS`:** ベースとなる OS（コードネーム） (`-`を含まない文字)
- **`VARIANT`:** 追加情報があれば任意で指定

## Docker Hub

- prefix `anyenv-`
  - https://hub.docker.com/r/wyrdteam/anyenv

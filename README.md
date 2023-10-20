# dockle-sandbox
[Dockle](https://github.com/goodwithtech/dockle)を使ってみる。
検証時は`0.4.13`.

# Dockle概要
- セキュリティ監査とDockerfile lintの目的でImageに対して実行される。
- CIにも組み込みが可能で、GitHub Actions, CircleCIなどテンプレートが用意されている。
- プライベートレジストリへの認証には環境変数から認証情報を受け取る(e.g. `AWS_SECRET_ACCESS_KEY`とかを設定する。assume roleもいけるのか？)
- `dockle [IMAGE]`で使えるのがシンプルでいい

# Check Point
チェックする内容。
[CHECKPOINT.md](https://github.com/goodwithtech/dockle/blob/master/CHECKPOINT.md#docker-image-checkpoints).

# 使用感
- 学習コストがとても低く、シンプルな使い方で導入が楽。
- CIのテンプレートが用意されていて簡単。
- 一般的なプラクティスを検知できるので、アプリケーションのエンジニアが作ったDockerfileでも最低限のセキュリティは保てそう
- PRがマージされた際にイメージのビルド&プッシュが実行されると想定して、指定した`exit-level`でpushを中止する等の使い道になりそう？
 - インテグレーションが気になるところ(PR内で完結しないのでどうやって人間に気づかせるか)
- ローカルでの実行とGitHub Actionsでの実行結果が違う。
  - 基準はわからないが、クレデンシャルが含まれているエラーが出る。(versionなので別の分類をして欲しいところ)
```
FATAL	- CIS-DI-0010: Do not store credential in environment variables/files
	* Suspicious ENV key found : YARN_VERSION on /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.19 (You can suppress it with --accept-key)
```
   - これはaccept-key(cliだと`-ak`)を使って無視できる

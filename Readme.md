# How to

以下の手順はこれらを参考に再構築したものになります

- [install-by-docker](https://docs.fluentd.org/container-deployment/install-by-docker#step-0-install-docker)
- [fluent-plugin-s3](https://github.com/fluent/fluent-plugin-s3)


1. fluentd.confのs3の認証情報を記載<br/>
    使用するユーザにはS3バケットやオブジェクトにアクセス権限があること
2. 以下のコマンドでコンテナを起動
    ```
    > docker-compose up --build -d
    ```
3. ホストでcurl実行できる場合は、
    ```
    > curl -X POST -d 'json={"json":"message"}' http://localhost:9880/sample.test
    ```
4. ホストでcurl実行できない場合は、コンテナ内で同様の上記のcurlコマンドを実行する
    ```
    > docker exec -it td-agent bash

    > 上記のcurlを実行
    ```
5. 1分後に指定したS3バケットにログファイルが転送されていること
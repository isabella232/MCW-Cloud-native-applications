![Microsoft Cloud Workshops][logo]

<div class="MCWHeader1">
Cloud-native applications - Infrastructure edition
</div>

<div class="MCWHeader2">
Hands-on lab step-by-step
</div>

<div class="MCWHeader3">
February 2020
</div>

<!-- Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2020 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners. -->

このドキュメントに記載されている情報 (URL や他のインターネット Web サイト参照を含む) は、将来予告なしに変更することがあります。別途記載されていない場合、このソフトウェアおよび関連するドキュメントで使用している会社、組織、製品、ドメイン名、電子メール アドレス、ロゴ、人物、場所、出来事などの名称は架空のものです。実在する商品名、団体名、個人名などとは一切関係ありません。お客様ご自身の責任において、適用されるすべての著作権関連法規に従ったご使用をお願いいたします。著作権法による制限に関係なく、マイクロソフトの書面による許可なしに、このドキュメントの一部または全部を複製したり、検索システムに保存または登録したり、別の形式に変換したりすることは、手段、目的を問わず禁じられています。ここでいう手段とは、複写や記録など、電子的、または物理的なすべての手段を含みます。

マイクロソフトは、このドキュメントに記載されている内容に関し、特許、特許申請、商標、著作権、またはその他の無体財産権を有する場合があります。別途マイクロソフトのライセンス契約上に明示の規定のない限り、このドキュメントはこれらの特許、商標、著作権、またはその他の知的財産権に関する権利をお客様に許諾するものではありません。

製造元名、製品名、URL は、情報提供のみを目的としており、これらの製造元またはマイクロソフトのテクノロジを搭載した製品の使用について、マイクロソフトは、明示的、黙示的、または法令によるいかなる表明も保証もいたしません。製造元または製品に対する言及は、マイクロソフトが当該製造元または製品を推奨していることを示唆するものではありません。掲載されているリンクは、外部サイトへのものである場合があります。これらのサイトはマイクロソフトの管理下にあるものではなく、リンク先のサイトのコンテンツ、リンク先のサイトに含まれているリンク、または当該サイトの変更や更新について、マイクロソフトは一切責任を負いません。リンク先のサイトから受信した Web キャストまたはその他の形式での通信について、マイクロソフトは責任を負いません。マイクロソフトは受講者の便宜を図る目的でのみ、これらのリンクを提供します。また、リンクの掲載は、マイクロソフトが当該サイトまたは当該サイトに掲載されている製品を推奨していることを示唆するものではありません。

© 2020 Microsoft Corporation. All rights reserved.

**Contents**

<!-- TOC -->

- [クラウドネイティブアプリケーション-インフラ管理者向けハンズオンラボのステップバイステップ](#クラウドネイティブアプリケーション-インフラ管理者向けハンズオンラボのステップバイステップ)
    - [概要および学習目標](#概要および学習目標)
    - [全体概要](#全体概要)
    - [ソリューションアーキテクチャ](#ソリューションアーキテクチャ)
    - [システム要件](#システム要件)
    - [演習1：Dockerアプリケーションを作成して実行する](#演習1dockerアプリケーションを作成して実行する)
        - [Task1：アプリケーションの動作確認](#task1アプリケーションの動作確認)
        - [Task2：Webアプリケーションの動作確認](#task2webアプリケーションの動作確認)
        - [Task3：Dockerイメージを作成する](#task3dockerイメージを作成する)
        - [Task4：コンテナー化されたアプリケーションを実行する](#task4コンテナー化されたアプリケーションを実行する)
        - [Task5：環境変数を設定する](#task5環境変数を設定する)
        - [Task6：Docker composeで複数コンテナーを実行する](#task6docker-composeで複数コンテナーを実行する)
        - [Task7：イメージをAzure Container Registryにプッシュする](#task7イメージをazure-container-registryにプッシュする)
        - [Task8：イメージをプッシュするためのCIパイプラインのセットアップ](#task8イメージをプッシュするためのciパイプラインのセットアップ)
    - [演習2：Azure Kubernetes Serviceにソリューションをデプロイする](#演習2azure-kubernetes-serviceにソリューションをデプロイする)
        - [Task1：Azure Kubernetes Serviceクラスターにトンネル接続する](#task1azure-kubernetes-serviceクラスターにトンネル接続する)
        - [Task2：Kubernetes管理ダッシュボードを使用してサービスをデプロイする](#task2kubernetes管理ダッシュボードを使用してサービスをデプロイする)
        - [Task3：kubectlを使用してサービスをデプロイする](#task3kubectlを使用してサービスをデプロイする)
        - [Task4：Helmチャートを使用してサービスをデプロイする](#task4helmチャートを使用してサービスをデプロイする)
        - [Task5：Kubernetes JobでCosmos DBを初期化する](#task5kubernetes-jobでcosmos-dbを初期化する)
        - [Task6：ブラウザーでアプリケーションをテストする](#task6ブラウザーでアプリケーションをテストする)
        - [Task7：Kubernetesクラスターへの継続的デリバリーを構成する](#task7kubernetesクラスターへの継続的デリバリーを構成する)
        - [Task8：コンテナーのAzure Monitorを確認する](#task8コンテナーのazure-monitorを確認する)
    - [演習3：アプリケーションのスケーリングとHAのテスト](#演習3アプリケーションのスケーリングとhaのテスト)
        - [Task1：Kubernetesダッシュボードからサービスインスタンスを増やす](#task1kubernetesダッシュボードからサービスインスタンスを増やす)
        - [Task2：利用可能なリソースを超えるサービスインスタンスを増やす](#task2利用可能なリソースを超えるサービスインスタンスを増やす)
        - [Task3：コンテナーを再起動してHAをテストする](#task3コンテナーを再起動してhaをテストする)
    - [演習4：サービスの操作とアプリケーショントラフィックのルーティング](#演習4サービスの操作とアプリケーショントラフィックのルーティング)
        - [Task1：ポートの制約なしでサービスをスケーリングする](#task1ポートの制約なしでサービスをスケーリングする)
        - [Task2：ロードバランサーによる動的検出をサポートするように外部サービスを更新する](#task2ロードバランサーによる動的検出をサポートするように外部サービスを更新する)
        - [Task3：スケールを改善するためにCPU制約を調整する](#task3スケールを改善するためにcpu制約を調整する)
        - [Task4：ローリング更新を実行する](#task4ローリング更新を実行する)
        - [Task5：Kubernetes Ingressを構成する](#task5kubernetes-ingressを構成する)
    - [ハンズオンラボの環境削除](#ハンズオンラボの環境削除)

<!-- /TOC -->

<!-- # Cloud-native applications - Infrastructure edition hands-on lab step-by-step -->
# クラウドネイティブアプリケーション-インフラ管理者向けハンズオンラボのステップバイステップ

<!-- ## Abstract and learning objectives -->
## 概要および学習目標

<!-- This hands-on lab is designed to guide you through the process of building and deploying Docker images to the Kubernetes platform hosted on Azure Kubernetes Services (AKS), in addition to learning how to work with dynamic service discovery, service scale-out, and high-availability. -->
このハンズオンラボは、Azure Kubernetes Services（AKS）でホストされているKubernetesプラットフォームにDockerイメージを構築してデプロイするプロセスに加えて、サービス検出、サービスのスケールアウト、およびオートヒーリングの機能確認などを行います。

<!-- At the end of this lab you will be better able to build and deploy containerized applications to Azure Kubernetes Service and perform common DevOps procedures. -->
このラボが終了すると、コンテナー化されたアプリケーションを構築してAzure Kubernetes Serviceにデプロイし、一般的なDevOps手順を実行できるようになります。

<!-- ## Overview -->
## 全体概要

<!-- Fabrikam Medical Conferences (FabMedical) provides conference website services tailored to the medical community. They are refactoring their application code, based on node.js, so that it can run as a Docker application, and want to implement a POC that will help them get familiar with the development process, lifecycle of deployment, and critical aspects of the hosting environment. They will be deploying their applications to Azure Kubernetes Service and want to learn how to deploy containers in a dynamically load-balanced manner, discover containers, and scale them on demand. -->
Fabrikam Medical Conferences（FabMedical）社は、医療コミュニティに合わせた会議Webサイトサービスを提供しています。彼らはnode.jsを使いアプリケーションコードをリファクタリングしているため、Dockerアプリケーションとして実行でき、開発プロセス、デプロイメントのライフサイクル、およびホスティングの重要な側面に慣れるのに役立つPoCを実施したいと考えています。彼らはアプリケーションをAzure Kubernetes Service にアプリケーションをデプロイし、オンデマンドでそれらをスケーリングする方法を学びたいと考えています。

<!-- In this hands-on lab, you will assist with completing this POC with a subset of the application codebase. You will create a build agent based on Linux, and an Azure Kubernetes Service cluster for running deployed applications. You will be helping them to complete the Docker setup for their application, test locally, push to an image repository, deploy to the cluster, and test load-balancing and scale. -->
このハンズオンラボでは、アプリケーションコードベースのサンプルを使用してPoCを行います。そのため、Linuxベースのビルドエージェントと、デプロイされたアプリケーションを実行するためのAzure Kubernetes Serviceクラスターを作成します。またビルド環境にDockerセットアップを行い、ローカルでテストし、イメージリポジトリにpushし、クラスターにデプロイし、負荷分散とスケーリングをテストする流れで実施します。

<!-- > **Important**: Most Azure resources require unique names. Throughout these steps, you will see the word "SUFFIX" as part of resource names. You should replace this with a unique handle (like your Microsoft Account email prefix) to ensure unique names for resources. -->
> **重要**：ほとんどのAzureリソースには一意の名前が必要です。これらの手順全体を通して、リソース名の一部として「SUFFIX」という単語が表示されます。リソースの一意の名前を確保するには、これを一意のハンドル（Microsoftアカウントの電子メールプレフィックスなど）に置き換える必要があります。

<!-- ## Solution architecture -->
## ソリューションアーキテクチャ

<!-- Below is a diagram of the solution architecture you will build in this lab. Please study this carefully, so you understand the whole of the solution as you are working on the various components. -->
以下は、このラボで構築するソリューションアーキテクチャの構成図です。各Taskに取り組んでいる際これをベースにしてソリューション全体を理解してください。

<!-- The solution will use Azure Kubernetes Service (AKS), which means that the container cluster topology is provisioned according to the number of requested nodes. The proposed containers deployed to the cluster are illustrated below with Cosmos DB as a managed service: -->
ソリューションはAzure Kubernetes Service（AKS）を使用します。要求されたノードの数に応じてKubernetesクラスターがプロビジョニングされます。クラスターにデプロイされたコンテナーは、Cosmos DBを利用します。

![A diagram showing the solution, using Azure Kubernetes Service with a Cosmos DB back end.](media/image3.png)

<!-- Each tenant will have the following containers: -->
各テナントには次のコンテナがあります。

- **Conference Web site**:
 <!-- The SPA application that will use configuration settings to handle custom styles for the tenant. -->
構成設定を使用してテナント個別のスタイルを処理するSPAアプリケーション。

- **Admin Web site**: 
<!-- The SPA application that conference owners use to manage conference configuration details, manage attendee registrations, manage campaigns, and communicate with attendees. -->
カンファレンスの所有者がカンファレンス構成の詳細の管理、参加者登録の管理、キャンペーンの管理、および参加者との連絡に使用するためのSPAアプリケーション。

- **Registration service**: 
<!-- The API that handles all registration activities creating new conference registrations with the appropriate package selections and associated cost. -->
すべての登録アクティビティを処理するAPIで、適切なパッケージの選択して新しいカンファレンスの登録行います。

- **Email service**: 
<!-- The API that handles email notifications to conference attendees during registration, or when the conference owners choose to engage the attendees through their admin site. -->
登録中、またはカンファレンスの所有者がサイトを通じて参加者を参加させることを選択したときに、カンファレンスの参加者への電子メール通知を処理するためのAPIです。

- **Config service**: 
<!-- The API that handles conference configuration settings such as dates, locations, pricing tables, early-bird specials, countdowns, and related. -->
日付、場所、価格表、早割割引、カウントダウンなどのカンファレンス構成設定を処理するAPIです。

- **Content service**: 
<!-- The API that handles content for the conference such as speakers, sessions, workshops, and sponsors. -->
スピーカー、セッション、ワークショップ、スポンサーなど、カンファレンスのコンテンツを処理するAPIです。

<!-- ## Requirements -->
## システム要件

<!-- 1. Microsoft Azure subscription must be pay-as-you-go or MSDN.

   - Trial subscriptions will _not_ work.

   - To complete this lab, ensure your account has the following roles:

     - The [Owner](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#owner)
       built-in role for the subscription you will use.

     - Is a [Member](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/users-default-permissions#member-and-guest-users) user in the Azure AD tenant you will use. (Guest users will not have the necessary permissions).

     > **Note** If you do not meet these requirements, you may have to ask another member user with subscription owner rights to login to the portal and execute the create service principal step ahead of time.

   - You must have enough cores available in your subscription to create the
     build agent and Azure Kubernetes Service cluster in Before the Hands-on
     Lab. You will need eight cores if following the exact instructions in the
     lab, or more if you choose additional cluster nodes or larger VM sizes.
     If you execute the steps required before the lab, you will be able to
     see if you need to request more cores in your sub.

2. Local machine or a virtual machine configured with:

   - A browser, preferably Chrome for consistency with the lab implementation tests.

3. You will install other tools throughout the exercises. -->

1. Microsoft Azure サブスクリプションが従量課金制または MSDN であること。

   - 試用版のサブスクリプションは使用できません。

   - このラボのセットアップ (「[Task 5: サービス プリンシパルの作成](#Task-5-サービス-プリンシパルの作成)」を含む) を完了するには、お使いのアカウントが以下の条件を満たしている必要があります。

     - 使用するサブスクリプション用に、組み込みの[オーナー (英語)](https://docs.microsoft.com/ja-jp/azure/role-based-access-control/built-in-roles#owner) のロールを保有している。

     - 使用している Azure AD テナントの[メンバー (英語)](https://docs.microsoft.com/ja-jp/azure/active-directory/fundamentals/users-default-permissions#member-and-guest-users) ユーザーである (ゲスト ユーザーには、必要な権限がありません)。

     > **注:** これらの要件を満たしていない場合、ポータルにログインしてサービス プリンシパルを作成する作業は、サブスクリプション オーナーの権限を持つ他のメンバー ユーザーに依頼してください。

   - 「[Task 6: ARM テンプレートの展開](#Task-6-arm-テンプレートの展開)」でビルド エージェントと Azure Kubernetes Service クラスターを作成できるよう、サブスクリプションには十分な数のコアを用意する必要があります。ラボの指示に正確に従えば、必要なコアの数は 8 つですが、エージェントの数を増やす場合や、VM のサイズを大きくするときには、さらにコアが必要になります。ラボの開始前に必要な手順を実行し、追加コアの要求申請が必要ないか確認しましょう。

2. Azure DevOps のアカウント

3. 以下のソフトを備えたローカル マシンまたは仮想マシン

   - 任意のブラウザー。ラボの実装テストの一貫性を保つうえで Chrome が望ましい。



<!-- > **Very important**: You should be typing all the commands as they appear in the guide. Do not try to copy and paste to your command windows or other documents when instructed to enter the information shown in this document, except where explicitly stated in this document. There can be issues with Copy and Paste that result in errors, execution of instructions, or creation of file content. -->
> **非常に重要**：ガイドに表示されているすべてのコマンドを入力する必要があります。このドキュメントで明示的に述べられている場合を除き、このドキュメントに示されている情報を入力するように指示された場合は、コマンドウィンドウや他のドキュメントにコピーアンドペーストしないでください。コピーと貼り付けで問題が発生し、エラー、指示の実行、またはファイルコンテンツの作成が発生する可能性があります。

<!-- ## Exercise 1: Create and run a Docker application -->
## 演習1：Dockerアプリケーションを作成して実行する

<!-- **Duration**: 40 minutes -->
**作業時間**：40分

<!-- In this exercise, you will take the starter files and run the node.js application as a Docker application. You will create a Dockerfile, build Docker images, and run containers to execute the application. -->
この演習では、サンプルファイルを取得して、Node.jsアプリケーションをDockerアプリケーションとして実行します。 Dockerfileを作成し、Dockerイメージをビルドし、コンテナーを実行してアプリケーションを実行します。

<!-- ### Task 1: Test the application -->
### Task1：アプリケーションの動作確認

<!-- The purpose of this task is to make sure you can run the application successfully before applying changes to run it as a Docker application. -->
このタスクの目的は、変更を適用してDockerアプリケーションとして実行する前に、アプリケーションを正常に実行できることを確認することです。

<!-- 1. From Azure Cloud Shell, connect to your build agent if you are not already connected. (If you need to reconnect, please review the instructions in the "Before the HOL" document.) -->
1. まだ接続していない場合は、Azure Cloud Shellからビルドエージェントに接続します。 （再接続する必要がある場合は、「Before the HOL」ドキュメントの手順を確認してください。）

<!-- 2. Type the following command to create a Docker network named "fabmedical": -->
2. 次のコマンドを入力して、「fabmedical」という名前のDockerネットワークを作成します。

   ```bash
   docker network create fabmedical
   ```

<!-- 3. Run an ?instance of mongodb to use for local testing. -->
3. ローカルテストに使用するmongodbのインスタンスを実行します。

   ```bash
   docker container run --name mongo --net fabmedical -p 27017:27017 -d mongo
   ```

<!-- 4. Confirm that the mongo container is running and ready. -->
4. mongoコンテナが実行中で準備ができていることを確認します。

   ```bash
   docker container list
   docker container logs mongo
   ```

   <!-- ![In this screenshot of the console window, docker container list has been typed and run at the command prompt, and the “api” container is in the list. Below this the log output is shown.](media/Ex1-Task1.4.png) -->
   ![このスクリーンショットでは、Dockerコンテナーのリストが入力されてコマンドプロンプトで実行されており、「api」コンテナーがリストに含まれています。この下にログ出力が表示されます。](media/Ex1-Task1.4.png)

<!-- 5. Connect to the mongo instance using the mongo shell and test some basic commands: -->
5. mongoシェルを使用してmongoインスタンスに接続し、いくつかの基本的なコマンドをテストします。

   ```bash
   mongo
   ```

   ```text
   show dbs
   quit()
   ```

   ![This screenshot of the console window shows the output from connecting to mongo.](media/Ex1-Task1.5.png)

<!-- 6. To initialize the local database with test content, first navigate to the content-init directory and run npm install. -->
6. ローカルのデータベースにテストデータを挿入するには、最初にcontent-initディレクトリに移動し、npm installを実行します。

   ```bash
   cd content-init
   npm install
   ```

   <!-- > **Note**: In some cases, the `root` user will be assigned ownership of your user's `.config` folder. If this happens, run the following command to return ownership to `adminfabmedical` and then try `npm install` again: -->
   > **注**：場合によっては、 `root`ユーザーにユーザーの` .config`フォルダーの所有権が割り当てられます。これが発生した場合は、次のコマンドを実行して所有権を「adminfabmedical」に戻し、次に「npm install」を再試行します。

   ```bash
   sudo chown -R $USER:$(id -gn $USER) /home/adminfabmedical/.config
   ```

<!-- 7. Initialize the database. -->
7. データベースを初期化します。

   ```bash
   nodejs server.js
   ```

   ![This screenshot of the console window shows output from running the database initialization.](media/Ex1-Task1.7.png)

<!-- 8. Confirm that the database now contains test data. -->
8. データベースにテストデータが含まれていることを確認します。

   ```bash
   mongo
   ```

   ```text
   show dbs
   use contentdb
   show collections
   db.speakers.find()
   db.sessions.find()
   quit()
   ```

   <!-- This should produce output similar to the following: -->
   これにより、次のような出力が生成されます。

   ![This screenshot of the console window shows the data output.](media/Ex1-Task1.8.png)

<!-- 9. Now navigate to the content-api directory and run npm install. -->
9. 次にcontent-apiディレクトリに移動し、npm installを実行します。

   ```bash
   cd ../content-api
   npm install
   ```

   <!-- > **Note**: In some cases, the `root` user will be assigned ownership of your user's `.config` folder. If this happens, run the following command to return ownership to `adminfabmedical` and then try `npm install` again: -->
   > **注**：場合によっては、 `root`ユーザーにユーザーの` .config`フォルダーの所有権が割り当てられます。これが発生した場合は、次のコマンドを実行して所有権を「adminfabmedical」に戻し、次に「npm install」を再試行します。

   ```bash
   sudo chown -R $USER:$(id -gn $USER) /home/adminfabmedical/.config
   ```

<!-- 10. Start the API as a background process. -->
10. APIをバックグラウンドプロセスとして開始します。

    ```bash
    nodejs ./server.js &
    ```

    ![In this screenshot, nodejs ./server.js & has been typed and run at the command prompt, which starts the API as a background process.](media/image47.png)

<!-- 11. Press ENTER again to get to a command prompt for the next step. -->
11. Enterキーをもう一度押して、次の手順のコマンドプロンプトを表示します。

<!-- 12. Test the API using curl. You will request the speaker's content, and this will return a JSON result. -->
12. curlを使用してAPIをテストします。スピーカーのコンテンツをリクエストすると、JSON結果が返されます。

    ```bash
    curl http://localhost:3001/speakers
    ```

    ![In this screenshot, made a curl request to view speakers.](media/image47_1.png)

<!-- 13. Navigate to the web application directory, run npm install and ng build. -->
13. Webアプリケーションディレクトリに移動し、npm installおよびng buildを実行します。

    ```bash
    cd ../content-web
    npm install
    ng build
    node ./app.js &
    ```

    ![In this screenshot, after navigating to the web application directory, nodejs ./server.js & has been typed and run at the command prompt, which runs the application as a background process as well.](media/image48.png)

    <!-- > **Note**: In some cases, the `root` user will be assigned ownership of your user's `.config` folder. If this happens, run the following command to return ownership to `adminfabmedical` and then try `npm install` again: -->
    > **注**：場合によっては、 `root`ユーザーにユーザーの` .config`フォルダーの所有権が割り当てられます。これが発生した場合は、次のコマンドを実行して所有権を「adminfabmedical」に戻し、次に「npm install」を再試行します。

    ```bash
    sudo chown -R $USER:$(id -gn $USER) /home/adminfabmedical/.config
    ```

<!-- 14. Press ENTER again to get a command prompt for the next step. -->
14. Enterキーをもう一度押して、次のステップのコマンドプロンプトを表示します。

<!-- 15. Test the web application using curl. You will see HTML output returned without errors. -->
15. curlを使用してWebアプリケーションをテストします。HTML出力が返されます。

    ```bash
    curl http://localhost:3000
    ```

<!-- 16. Leave the application running for the next task. -->
16. 次のタスクのためにアプリケーションを実行したままにします。

<!-- 17. If you received a JSON response to the /speakers content request and an HTML response from the web application, your environment is working as expected. -->
17. /speakersコンテンツ要求に対するJSON応答とWebアプリケーションからのHTML応答を受け取った場合、環境は期待どおりに機能しているのが分かります。。

<!-- ### Task 2: Browsing to the web application -->
### Task2：Webアプリケーションの動作確認

<!-- In this task, you will browse to the web application for testing. -->
このタスクでは、テスト用のWebアプリケーションの動作確認をします。

<!-- 1. From the Azure portal select the resource group you created named fabmedical-SUFFIX. -->
1. Azureポータルから、作成したfabmedical-[SUFFIX]という名前のリソースグループを選択します。

<!-- 2. Select the build agent VM named fabmedical-SUFFIX from your list of available resources. -->
2. 使用可能なリソースのリストから、fabmedical-[SUFFIX]という名前のビルドエージェントVMを選択します。

   ![In this screenshot of your list of available resources, the first item is selected, which has the following values for Name, Type, and Location: fabmedical-soll (a red arrows points to this name), Virtual machine, and East US 2.](media/image54.png)

<!-- 3. From the Virtual Machine blade overview, find the IP address of the VM. -->
3. 仮想マシンブレードの概要から、VMのIPアドレスを見つけます。

   ![In the Virtual Machine blade, Overview is selected on the left and Public IP address 52.174.141.11 is highlighted on the right.](media/image26.png)

<!-- 4. Test the web application from a browser. Navigate to the web application using your build agent IP address at port 3000. -->
4. ブラウザからWebアプリケーションをテストします。ビルドエージェントのIPアドレスのポート3000を使用してWebアプリケーションを表示します。

   ```text
   http://[BUILDAGENTIP]:3000

   EXAMPLE: http://13.68.113.176:3000
   ```

<!-- 5. Select the Speakers and Sessions links in the header. You will see the pages display the HTML version of the JSON content you curled previously. -->
5. ヘッダーの[Speaker][Session]のリンクを選択します。以前にcurlコマンドで取得したJSONコンテンツのHTMLバージョンがページに表示されます。

<!-- 6. Once you have verified the application is accessible through a browser, go to your cloud shell window and stop the running node processes. -->
6. Webブラウザからアプリケーションにアクセスできることを確認したら、クラウドシェルウィンドウに移動して、実行中のノードプロセスを停止します。

   ```bash
   killall nodejs
   killall node
   ```

<!-- ### Task 3: Create Docker images -->
### Task3：Dockerイメージを作成する

<!-- In this task, you will create Docker images for the application --- one for the API application and another for the web application. Each image will be created via Docker commands that rely on a Dockerfile. -->
このタスクでは、アプリケーションのDockerイメージを作成します。1つはAPIアプリケーション用、もう1つはWebアプリケーション用です。各イメージは、Dockerfileに依存するDockerコマンドを介して作成されます。

<!-- 1. From cloud shell connected to the build agent VM, type the following command to view any Docker images on the VM. The list will only contain the mongodb image downloaded earlier. -->
1. まずビルドエージェントVMに接続されているCloud Shellから次のコマンドを入力して、VM上のDockerイメージを表示します。リストには、以前にダウンロードしたmongodbイメージのみが含まれます。

   ```bash
   docker image ls
   ```

<!-- 2. From the content-api folder containing the API application files and the new Dockerfile you created, type the following command to create a Docker image for the API application. This command does the following: -->
2. APIアプリケーションファイルと作成した新しいDockerfileを含むcontent-apiフォルダーから、次のコマンドを入力して、APIアプリケーションのDockerイメージを作成します。このコマンドは次を行います。

   <!-- - Executes the Docker build command to produce the image -->
   - Dockerビルドコマンドを実行してイメージを生成します

   <!-- - Tags the resulting image with the name content-api (-t) -->
   - 結果のイメージにcontent-apiという名前のタグ(-t)を付けます。

   <!-- - The final dot (".") indicates to use the Dockerfile in this current directory context. By default, this file is expected to have the name "Dockerfile" (case sensitive). -->
   - 最後のドット（"."）は、この現在のディレクトリコンテキストでDockerfileを使用することを示します。デフォルトでは、このファイルの名前は "Dockerfile"（大文字と小文字を区別）であるとみなされています。

   ```bash
   docker image build -t content-api .
   ```

<!-- 3. Once the image is successfully built, run the Docker images listing command again. You will see several new images: the node images and your container image. -->
3. イメージが正常に構築されたら、docker image list コマンドを再度実行します。新しいイメージがいくつか表示されます。Node.jsのイメージとcontent-apiイメージです。

   ```bash
   docker image ls
   ```

   <!-- Notice the untagged image. This is the build stage which contains all the intermediate files not needed in your final image. -->
   タグ付けされていないイメージに注目してください。これは、最終イメージに不要なすべての中間ファイルを含むビルドステージです。

   ![The node image (node) and your container image (content-api) are visible in this screenshot of the console window.](media/image59.png)

<!-- 4. Navigate to the content-web folder again and list the files. Note that this folder has a Dockerfile. -->
4. content-webフォルダーに再度移動し、ファイルを一覧表示します。このフォルダにはDockerfileがあることを確認してください。

   ```bash
   cd ../content-web
   ll
   ```

<!-- 5. View the Dockerfile contents -- which are similar to the file in the API folder. Type the following command: -->
5. Dockerfileの内容を確認します。次のコマンドを入力します。

   ```bash
   cat Dockerfile
   ```

   <!-- Notice that the content-web Dockerfile build stage includes additional tools for a front-end Angular application in addition to installing npm packages. -->
   content-web Dockerfileビルドステージには、npmパッケージのインストールに加えて、フロントエンドAngularアプリケーション用の追加ツールが含まれていることに注意してください。

<!-- 6. Type the following command to create a Docker image for the web application. -->
6. 次のコマンドを入力して、WebアプリケーションのDockerイメージを作成します。

   ```bash
   docker image build -t content-web .
   ```

<!-- 7. When complete, you will see seven images now exist when you run the Docker images command. -->
7. 完了すると、Docker imagesコマンドを実行すると、7つのイメージが存在するようになります。

   ```bash
   docker image ls
   ```

   ![Three images are now visible in this screenshot of the console window: content-web, content-api, and node.](media/image60.png)

<!-- ### Task 4: Run a containerized application -->
### Task4：コンテナー化されたアプリケーションを実行する

<!-- The web application container will be calling endpoints exposed by the API application container and the API application container will be communicating with mongodb. In this exercise, you will launch the images you created as containers on the same bridge network you created when starting mongodb. -->
WebアプリケーションコンテナーはAPIアプリケーションコンテナーによって公開されたエンドポイントを呼び出し、APIアプリケーションコンテナーはmongodbと通信します。この演習では、mongodbの起動時に作成したのと同じブリッジネットワーク上にコンテナーとして作成したイメージを起動します。

<!-- 1. Create and start the API application container with the following command. The command does the following: -->
1. 次のコマンドを使用して、APIアプリケーションコンテナーを作成して起動します。コマンドは次のことを行います。

   <!-- - Names the container "api" for later reference with Docker commands. -->
   - Dockerコマンドでコンテナーに「api」という名前を付けます。

   <!-- - Instructs the Docker engine to use the "fabmedical" network. -->
   -「fabmedical」ネットワークを使用するようにDockerエンジンに指定します。

   <!-- - Instructs the Docker engine to use port 3001 and map that to the internal container port 3001. -->
  - Dockerエンジンにポート3001を使用して内部コンテナーポート3001にマップするように指定します。

   <!-- - Creates a container from the specified image, by its tag, such as content-api. -->
  - content-apiなどのタグを使用して、指定したイメージからコンテナを作成します。

   ```bash
   docker container run --name api --net fabmedical -p 3001:3001 content-api
   ```

<!-- 2. The `docker container run` command has failed because it is configured to connect to mongodb using a localhost URL. However, now that content-api is isolated in a separate container, it cannot access mongodb via localhost even when running on the same docker host. Instead, the API must use the bridge network to connect to mongodb. -->
2. localhostのURLを使用してmongodbに接続するように設定されているため、 `docker container run`コマンドは失敗しました。ただし、content-apiは別のコンテナーに分離されているため、同じdockerホストで実行されている場合でも、localhostを介してmongodbにアクセスできません。代わりに、APIはブリッジネットワークを使用してmongodbに接続する必要があります。

   ```text
   > content-api@0.0.0 start /usr/src/app
   > node ./server.js

   Listening on port 3001
   Could not connect to MongoDB!
   MongoTimeoutError: Server selection timed out after 30000 ms
   npm ERR! code ELIFECYCLE
   npm ERR! errno 255
   npm ERR! content-api@0.0.0 start: `node ./server.js`
   npm ERR! Exit status 255
   npm ERR!
   npm ERR! Failed at the content-api@0.0.0 start script.
   npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

   npm ERR! A complete log of this run can be found in:
   npm ERR!     /root/.npm/_logs/2019-12-04T22_39_38_815Z-debug.log
   ```

<!-- 3. The content-api application allows an environment variable to configure the mongodb connection string. Remove the existing container, and then instruct the docker engine to set the environment variable by adding the `-e` switch to the `docker container run` command. Also, use the `-d` switch to run the api as a daemon. -->
3. content-apiアプリケーションでは、環境変数でmongodb接続文字列を構成できます。既存のコンテナーを削除してから、 `-e`オプションを` docker container run`コマンドに追加して、環境変数を設定するようにDockerエンジンに設定します。また、 `-d`オプションを使用してAPIをデーモンとして実行します。

   ```bash
   docker container rm api
   docker container run --name api --net fabmedical -p 3001:3001 -e MONGODB_CONNECTION=mongodb://mongo:27017/contentdb -d content-api
   ```

<!-- 4. Enter the command to show running containers. You will observe that the "api" container is in the list. Use the docker logs command to see that the API application has connected to mongodb. -->
4. コマンドを入力して、実行中のコンテナーを表示します。 「api」コンテナがリストにあることがわかります。 docker logsコマンドを使用して、APIアプリケーションがmongodbに接続したことを確認します。

   ```bash
   docker container ls
   docker container logs api
   ```

   ![In this screenshot of the console window, docker container ls has been typed and run at the command prompt, and the "api" container is in the list with the following values for Container ID, Image, Command, Created, Status, Ports, and Names: 458d47f2aaf1, content-api, "docker-entrypoint.s...", 37 seconds ago, Up 36 seconds, 0.0.0.0:3001->3001/tcp, and api.](media/image61.png)

<!-- 5. Test the API by curling the URL. You will see JSON output as you did when testing previously. -->
5. curlコマンドでAPIをテストします。以前のテストと同じように、JSON出力が表示されます。

   ```bash
   curl http://localhost:3001/speakers
   ```

<!-- 6. Create and start the web application container with a similar `docker container run` command -- instruct the docker engine to use any port with the `-P` command. -->
6. 同様に `docker container run`コマンドでWebアプリケーションコンテナーを作成して起動します-`-P`オプションで任意のポートを使用するようにDockerエンジンに指示します。

   ```bash
   docker container run --name web --net fabmedical -P -d content-web
   ```

<!-- 7. Enter the command to show running containers again, and you will observe that both the API and web containers are in the list. The web container shows a dynamically assigned port mapping to its internal container port 3000. -->
7. コマンドを入力して、実行中のコンテナーを再度表示すると、APIコンテナーとWebコンテナーの両方がリストに含まれていることがわかります。 Webコンテナーは、内部コンテナーポート3000に動的に割り当てられたポートマッピングを示します。

   ```bash
   docker container ls
   ```

   ![In this screenshot of the console window, docker container ls has again been typed and run at the command prompt. 0.0.0.0:32768->3000/tcp is highlighted under Ports.](media/image62.png)

<!-- 8. Test the web application by fetching the URL with curl. For the port, use the dynamically assigned port, which you can find in the output from the previous command. You will see HTML output, as you did when testing previously. -->
8. curlでURLをフェッチして、Webアプリケーションをテストします。ポートには、動的に割り当てられたポートを使用します。これは、前のコマンドの出力で確認できます。以前と同様に、HTML出力が表示されます。

   ```bash
   curl http://localhost:[PORT]/speakers.html
   ```

<!-- ### Task 5: Setup environment variables -->
### Task5：環境変数を設定する

<!-- In this task, you will configure the "web" container to communicate with the API container using an environment variable, similar to the way the mongodb connection string is provided to the api. -->
このタスクでは、mongodb接続文字列がAPIに提供される方法と同様に、環境変数を使用してAPIコンテナーと通信するようにWebコンテナーを構成します。

<!-- 1. From cloud shell connected to the build agent VM, stop and remove the web container using the following commands. -->
1. ビルドエージェントVMに接続されているCloud Shellから、次のコマンドを使用してWebコンテナーを停止・削除します。

   ```bash
   docker container stop web
   docker container rm web
   ```

<!-- 2. Validate that the web container is no longer running or present by using the -a flag as shown in this command. You will see that the "web" container is no longer listed. -->
2.このコマンドに示すように`-a`オプションを使用して、Webコンテナーが実行されていないこと、または存在していないことを確認します。 ここでは「web」コンテナがリストからなくなっていることがわかります。

   ```bash
   docker container ls -a
   ```

<!-- 3. Open the Dockerfile for editing using Vim and press the "i" key to go into edit mode. -->
3. Vimを使用して編集するDockerfileを開き、「i」キーを押して編集モードにします。

   ```bash
   vi Dockerfile
   <i>
   ```

<!-- 4. Locate the EXPOSE line shown below and add a line above it that sets the default value for the environment variable, as shown in the screenshot. -->
4. 以下に示すEXPOSE行を見つけ、その上に、スクリーンショットに示すように、環境変数のデフォルト値を設定する行を追加します。

   ```Dockerfile
   ENV CONTENT_API_URL http://localhost:3001
   ```

   ![In this screenshot of Dockerfile, the CONTENT_API_URL code appears above the next Dockerfile line, which reads EXPOSE 3000.](media/hol-2019-10-01_19-37-35.png)

<!-- 5. Press the Escape key and type ":wq" and then press the Enter key to save and close the file. -->
5. Escapeキーを押して「:wq」と入力し、Enterキーを押してファイルを保存して閉じます。

   ```text
   <Esc>
   :wq
   <Enter>
   ```

<!-- 6. Rebuild the web application Docker image using the same command as you did previously. -->
6. 以前と同じコマンドを使用して、WebアプリケーションのDockerイメージを再構築します。

   ```bash
   docker image build -t content-web .
   ```

<!-- 7. Create and start the image passing the correct URI to the API container as an environment variable. This variable will address the API application using its container name over the Docker network you created. After running the container, check to see the container is running and note the dynamic port assignment for the next step. -->
7. 正しいURIを環境変数としてAPIコンテナーに渡すイメージを作成して開始します。この変数は、作成したDockerネットワーク上のコンテナ名を使用してAPIアプリケーションをアドレス指定します。コンテナーを実行した後、コンテナーが実行されていることを確認し、動的にポートが割り当てられていることを確認します。

   ```bash
   docker container run --name web --net fabmedical -P -d -e CONTENT_API_URL=http://api:3001 content-web
   docker container ls
   ```

<!-- 8. Curl the speakers path again, using the port assigned to the web container. Again, you will see HTML returned, but because curl does not process javascript, you cannot determine if the web application is communicating with the api application. You must verify this connection in a browser. -->
8. Webコンテナーに割り当てられたポートを使用して、SpeakerのURLにcurlコマンドでアクセスします。ここでもHTMLが返されますが、curlはJavaScriptを処理しないため、WebアプリケーションがAPIアプリケーションと通信しているかどうかを判断できません。この接続をブラウザで確認する必要があります。

   ```bash
   curl http://localhost:[PORT]/speakers.html
   ```

<!-- 9. You will not be able to browse to the web application on the ephemeral port because the VM only exposes a limited port range. Now you will stop the web container and restart it using port 3000 to test in the browser. Type the following commands to stop the container, remove it, and run it again using explicit settings for the port. -->
9. VMは限られたポート範囲しか公開しないため、一時ポートでWebアプリケーションを参照することはできません。次に、Webコンテナーを停止し、ポート3000を使用して再起動して、ブラウザーでテストします。次のコマンドを入力してコンテナを停止・削除して、ポートの明示的な設定を使用し再度実行します。

   ```bash
    docker container stop web
    docker container rm web
    docker container run --name web --net fabmedical -p 3000:3000 -d -e CONTENT_API_URL=http://api:3001 content-web
   ```

<!-- 10. Curl the speaker path again, using port 3000. You will see the same HTML returned. -->
10. ポート3000を使用して、SpeakerのURLにcurlでアクセスします。同じHTMLが返されます。

    ```bash
    curl http://localhost:3000/speakers.html
    ```

<!-- 11. You can now use a web browser to navigate to the website and successfully view the application at port 3000. Replace [BUILDAGENTIP] with the IP address you used previously. -->
11. これで、Webブラウザーを使用してWebサイトに移動し、ポート3000でアプリケーションを正常に表示できます。[BUILDAGENTIP]を以前に使用したIPアドレスに置き換えます。

    ```bash
    http://[BUILDAGENTIP]:3000

    EXAMPLE: http://13.68.113.176:3000
    ```

<!-- 12. Commit your changes and push to the repository. -->
12. 変更をコミットし、リポジトリにプッシュします。

    ```bash
    git add .
    git commit -m "Setup Environment Variables"
    git push
    ```

   <!-- Enter credentials if prompted. -->
   プロンプトが表示されたら資格情報を入力します。

<!-- ### Task 6: Run several containers with Docker compose -->
### Task6：Docker composeで複数コンテナーを実行する

<!-- Managing several containers with all their command line options can become difficult as the solution grows. `docker-compose` allows us to declare options for several containers and run them together. -->
ソリューションが大きくなるにつれて、すべてのコマンドラインオプションを使用して複数のコンテナーを管理することが困難になる可能性があります。 `docker-compose`を使用すると、複数のコンテナーのオプションを宣言して、それらをまとめてに実行できます。

<!-- 1. First, cleanup the existing containers. -->
1. 最初に、動いているコンテナーをクリーンアップします。

   ```bash
   docker container stop web && docker container rm web
   docker container stop api && docker container rm api
   docker container stop mongo && docker container rm mongo
   ```

<!-- 2. Navigate to your home directory (where you checked out the content repositories) and create a docker compose file. -->
2. ホームディレクトリ（コンテンツリポジトリをチェックアウトした場所）に移動し、docker composeファイルを作成します。

   ```bash
   cd ~
   vi docker-compose.yml
   <i>
   ```

   <!-- Type the following as the contents of `docker-compose.yml`: -->
   `docker-compose.yml`のコンテンツとして次のように入力します。

   ```yaml
   version: "3.4"

   services:
     mongo:
       image: mongo
       restart: always

     api:
       build: ./content-api
       image: content-api
       depends_on:
         - mongo
       environment:
         MONGODB_CONNECTION: mongodb://mongo:27017/contentdb

     web:
       build: ./content-web
       image: content-web
       depends_on:
         - api
       environment:
         CONTENT_API_URL: http://api:3001
       ports:
         - "3000:3000"
   ```

   <!-- Press the Escape key and type ":wq" and then press the Enter key to save and close the file. -->
   Escapeキーを押して「:wq」と入力し、Enterキーを押してファイルを保存して閉じます。

   ```text
   <Esc>
   :wq
   <Enter>
   ```

<!-- 3. Start the applications with the `up` command. -->
3. `docker-compose up`コマンドでアプリケーションを起動します。

   ```bash
   docker-compose -f docker-compose.yml -p fabmedical up -d
   ```

   ![This screenshot of the console window shows the creation of the network and three containers: mongo, api and web.](media/Ex1-Task6.17.png)

<!-- 4. Visit the website in the browser; notice that we no longer have any data on the speakers or sessions pages. -->
4. ブラウザでWebサイトにアクセスします。SpeakerやSessionのページにはデータがなくなっていることに注意してください。

   ![Browser view of the web site.](media/Ex1-Task6.18.png)

<!-- 5. We stopped and removed our previous mongodb container; all the data contained in it has been removed. Docker compose has created a new, empty mongodb instance that must be reinitialized. If we care to persist our data between container instances, docker has several mechanisms to do so. First, we will update our compose file to persist mongodb data to a directory on the build agent. -->
5. 以前のmongodbコンテナを停止・削除しました。そのため含まれるすべてのデータは削除されました。 Docker composeが新しい空のmongodbインスタンスを作成したため、再初期化する必要があります。コンテナーインスタンス間でデータを永続化したい場合は、dockerにはそのためのメカニズムがいくつかあります。まず作成ファイルを更新して、mongodbデータをビルドエージェントのディレクトリに永続化します。

   ```bash
   mkdir data
   vi docker-compose.yml
   ```

   <!-- Update the mongo service to mount the local data directory onto to the `/data/db` volume in the docker container. -->
   mongoサービスを更新して、ローカルデータディレクトリをDockerコンテナーの `/data/db`ボリュームにマウントします。

   ```yaml
   mongo:
     image: mongo
     restart: always
     volumes:
       - ./data:/data/db
   ```

   <!-- The result should look similar to the following screenshot: -->
   結果は次のスクリーンショットのようになります。

   ![This screenshot of the VIM edit window shows the resulting compose file.](media/Ex1-Task6.19.png)

<!-- 6. Next, we will add a second file to our composition so that we can initialize the mongodb data when needed. -->
6. 次に、必要に応じてmongodbデータを初期化できるように、2番目のファイルを追加します。

   ```bash
   vi docker-compose.init.yml
   ```

   <!-- Add the following as the content: -->
   以下を追加します。

   ```yaml
   version: "3.4"

   services:
     init:
       build: ./content-init
       image: content-init
       depends_on:
         - mongo
       environment:
         MONGODB_CONNECTION: mongodb://mongo:27017/contentdb
   ```

<!-- 7. To reconfigure the mongodb volume, we need to bring down the mongodb service first. -->
7. mongodbボリュームを再構成するには、最初にmongodbサービスを停止する必要があります。

   ```bash
   docker-compose -f docker-compose.yml -p fabmedical down
   ```

   ![This screenshot of the console window shows the running containers stopping.](media/Ex1-Task6.21.png)

<!-- 8. Now run `up` again with both files to update the mongodb configuration and run the initialization script. -->
8. 次に、両方のファイルを使用して「docker-compose up」を再度実行し、mongodb構成を更新して初期化スクリプトを実行します。

   ```bash
   docker-compose -f docker-compose.yml -f docker-compose.init.yml -p fabmedical up -d
   ```

<!-- 9. Check the data folder to see that mongodb is now writing data files to the host. -->
9. データフォルダーをチェックして、mongodbがデータファイルをホストに書き込んでいることを確認します。

   ```bash
   ls ./data/
   ```

   ![This screenshot of the console window shows the output of the data folder.](media/hol-2019-10-12_09-42-16.png)

<!-- 10. Check the results in the browser. The speaker and session data are now available. -->
10. ブラウザで結果を確認します。講演者とセッションのデータが利用可能になりました。

    ![A screenshot of the sessions page.](media/Ex1-Task6.24.png)

<!-- ### Task 7: Push images to Azure Container Registry -->
### Task7：イメージをAzure Container Registryにプッシュする

<!-- To run containers in a remote environment, you will typically push images to a Docker registry, where you can store and distribute images. Each service will have a repository that can be pushed to and pulled from with Docker commands. Azure Container Registry (ACR) is a managed private Docker registry service based on Docker Registry v2. -->
リモート環境でコンテナーを実行するには、通常、イメージをDockerレジストリーにプッシュします。Dockerレジストリーでは、イメージを保管および配布できます。各サービスには、Dockerコマンドでプッシュおよびプルできるリポジトリがあります。 Azure Container Registry（ACR）は、Docker Registry v2に基づくマネージドプライベートDockerレジストリサービスです。

<!-- In this task, you will push images to your ACR account, version images with tagging, and setup continuous integration (CI) to build future versions of your containers and push them to ACR automatically. -->
このタスクでは、イメージをACRアカウントにプッシュし、タグ付きのバージョンイメージを作成し、継続的インテグレーション（CI）をセットアップして、コンテナーにバージョンを設定し自動的にACRにプッシュします。

<!-- 1. In the [Azure Portal](https://portal.azure.com/), navigate to the ACR you created in Before the hands-on lab. -->
1. [Azureポータル]（https://portal.azure.com/）で、ハンズオンラボの前に作成したACRに移動します。

<!-- 2. Select Access keys under Settings on the left-hand menu. -->
2. 左側のメニューの[設定]で[アクセスキー]を選択します。

   ![In this screenshot of the left-hand menu, Access keys is highlighted below Settings.](media/image64.png)

<!-- 3. The Access keys blade displays the Login server, username, and password that will be required for the next step. Keep this handy as you perform actions on the build VM. -->
3. [アクセスキー]に、次の手順で必要となるログインサーバー、ユーザー名、パスワードが表示されます。ビルドエージェントマシンでアクションを実行するときは、この情報が必要になります。

   <!-- > **Note**: If the username and password do not appear, select Enable on the Admin user option. -->
   > **注**：もしユーザー名とパスワードが表示されない場合は、[管理ユーザー]オプションで[有効にする]を選択してください。

<!-- 4. From the cloud shell session connected to your build VM, login to your ACR account by typing the following command. Follow the instructions to complete the login. -->
4. ビルドエージェントマシンに接続されているCloud Shellセッションから、次のコマンドを入力してACRアカウントにログインします。指示に従ってログインを完了します。

   ```bash
   docker login [LOGINSERVER] -u [USERNAME] -p [PASSWORD]
   ```

   For example:

   ```bash
   docker login fabmedicalsoll.azurecr.io -u fabmedicalsoll -p +W/j=l+Fcze=n07SchxvGSlvsLRh/7ga
   ```

   ![In this screenshot of the console window, the following has been typed and run at the command prompt: docker login fabmedicalsoll.azurecr.io --u fabmedicalsoll --p +W/j=l+Fcze=n07SchxvGSlvsLRh/7ga](media/image65.png)

   <!-- **Tip: Make surRe to specify the fully qualified registry login server (all lowercase).** -->
   **ヒント：完全修飾レジストリログインサーバー（すべて小文字）を指定するには、surReを作成します。**

<!-- 5. Run the following commands to properly tag your images to match your ACR account name. -->
5. 次のコマンドを実行して、ACRアカウント名と一致するようにイメージに適切にタグを付けます。

   ```bash
   docker image tag content-web [LOGINSERVER]/content-web
   docker image tag content-api [LOGINSERVER]/content-api
   ```

<!-- 6. List your docker images and look at the repository and tag. Note that the repository is prefixed with your ACR login server name, such as the sample shown in the screenshot below. -->
6. Dockerイメージを一覧表示し、リポジトリとタグを確認します。以下のスクリーンショットに示すサンプルのように、リポジトリの前にACRログインサーバー名が付いていることに注意してください。

   ```bash
   docker image ls
   ```

   ![This is a screenshot of a docker images list example.](media/image66.png)

<!-- 7. Push the images to your ACR account with the following command: -->
7. 次のコマンドを使用して、イメージをACRアカウントにプッシュします。

   ```bash
   docker image push [LOGINSERVER]/content-web
   docker image push [LOGINSERVER]/content-api
   ```

   ![In this screenshot of the console window, an example of images being pushed to an ACR account results from typing and running the following at the command prompt: docker push [LOGINSERVER]/content-web.](media/image67.png)

<!-- 8. In the Azure Portal, navigate to your ACR account, and select Repositories under Services on the left-hand menu. You will now see two, one for each image. -->
8. Azureポータルで、ACRに移動し、左側のメニューの[サービス]で[リポジトリ]を選択します。各イメージに1つずつ、合計2つが表示されます。

   ![In this screenshot, content-api and content-web each appear on their own lines below Repositories.](media/image68.png)

<!-- 9. Select content-api. You will see the latest tag is assigned. -->
9. content-apiを選択します。最新のタグが割り当てられていることがわかります。

   ![In this screenshot, content-api is selected under Repositories, and the Tags blade appears on the right.](media/image69.png)

<!-- 10. From the cloud shell session attached to the VM, assign the v1 tag to each image with the following commands. Then list the Docker images to note that there are now two entries for each image: showing the latest tag and the v1 tag. Also note that the image ID is the same for the two entries, as there is only one copy of the image. -->
10. ビルドエージェントマシンに接続されているCloud Shellセッションから、次のコマンドを使用して各イメージにv1タグを割り当てます。次に、Dockerイメージを一覧表示して、各イメージに2つのエントリがあることを確認します。最新のタグとv1タグを示しています。また、イメージのコピーは1つしかないため、2つのエントリのイメージIDは同じです。

    ```bash
    docker image tag [LOGINSERVER]/content-web:latest [LOGINSERVER]/content-web:v1
    docker image tag [LOGINSERVER]/content-api:latest [LOGINSERVER]/content-api:v1
    docker image ls
    ```

    ![In this screenshot of the console window is an example of tags being added and displayed.](media/image70.png)

<!-- 11. Repeat Step 7 to push the images to ACR again so that the newly tagged v1 images are pushed. Then refresh one of the repositories to see the two versions of the image now appear. -->
11. Step 7を繰り返して画像を再度ACRにプッシュし、新しくタグ付けされたv1イメージがプッシュされるようにします。次に、リポジトリの1つを更新して、イメージの2つのバージョンが表示されることを確認します。

    ![In this screenshot, content-api is selected under Repositories, and the Tags blade appears on the right. In the Tags blade, latest and v1 appear under Tags.](media/image71.png)

<!-- 12. Run the following commands to pull an image from the repository. Note that the default behavior is to pull images tagged with "latest." You can pull a specific version using the version tag. Also, note that since the images already exist on the build agent, nothing is downloaded. -->
12. 次のコマンドを実行して、リポジトリからイメージをプルします。デフォルトの動作では、「latest」のタグが付いたイメージがプルされることに注意してください。versionタグを使用して、特定のバージョンをプルできます。また、イメージはビルドエージェントにすでに存在するため、何もダウンロードされないことに注意してください。

    ```bash
    docker image pull [LOGINSERVER]/content-web
    docker image pull [LOGINSERVER]/content-web:v1
    ```

<!-- ### Task 8: Setup CI Pipeline to Push Images -->
### Task8：イメージをプッシュするためのCIパイプラインのセットアップ

<!-- In this task, you will use YAML to define a pipeline that builds your Docker image and pushes it to your ACR instance automatically. -->
このタスクでは、YAMLを使用して、Dockerイメージを構築し、それをACRインスタンスに自動的にプッシュするパイプラインを定義します。

<!-- 1. In your cloud shell session connected to the build agent VM, navigate to the `content-web` directory: -->
1.ビルドエージェントVMに接続されているCloud Shellセッションで、 `content-web`ディレクトリに移動します。

   ```bash
   cd ~/content-web
   ```

<!-- 2. Next create the pipeline YAML file. -->
2. 次に、パイプライン要のYAMLファイルを作成します。

   ```bash
   vi azure-pipelines.yml
   ```

   <!-- Add the following as the content (replacing SHORT_SUFFIX with your short suffix such as SOL): -->
   以下をコンテンツとして追加します（SHORT_SUFFIXをSOLなどの短いサフィックスで置き換えます）。

   ```yaml
   name: 0.1.$(Rev:r)

   trigger:
     - master

   resources:
     - repo: self

   variables:
     dockerRegistryServiceConnection: "Fabmedical ACR"
     imageRepository: "content-web"
     containerRegistry: "$(containerRegistryName).azurecr.io"
     containerRegistryName: "fabmedical[SHORT_SUFFIX]"
     dockerfilePath: "$(Build.SourcesDirectory)/Dockerfile"
     tag: "$(Build.BuildNumber)"
     vmImageName: "ubuntu-latest"

   stages:
     - stage: Build
       displayName: Build and Push
       jobs:
         - job: Docker
           displayName: Build and Push Docker Image
           pool:
             vmImage: $(vmImageName)
           steps:
             - checkout: self
               fetchDepth: 1

             - task: Docker@2
               displayName: Build and push an image to container registry
               inputs:
                 command: buildAndPush
                 repository: $(imageRepository)
                 dockerfile: $(dockerfilePath)
                 containerRegistry: $(dockerRegistryServiceConnection)
                 tags: |
                   $(tag)
                   latest
   ```

<!-- 3. Save the pipeline YAML, then commit and push it to the Azure DevOps repository: -->
3. パイプラインYAMLを保存してからコミットし、Azure DevOpsリポジトリにプッシュします。

   ```bash
   git add azure-pipelines.yml
   git commit -m "Added pipeline YAML"
   git push
   ```

<!-- 4. Now login to Azure DevOps to create your first build. Navigate to the `content-web` repository and choose 'Set up Build'. -->
4. Azure DevOpsにログインして、最初のビルドを作成します。 `content-web`リポジトリに移動し、[ビルドの設定]を選択します。

   ![A screenshot of the content-web repository with an arrow pointed at the Set up Build button](media/hol-2019-10-01_19-50-16.png)

<!-- 5. Azure DevOps will automatically detect the pipeline YAML you added. You can make additional edits here if needed. Select `Run` when you are ready to execute the pipeline. -->
5. Azure DevOpsは、追加したパイプラインYAMLを自動的に検出します。必要に応じて、ここで追加の編集を行うことができます。パイプラインを実行する準備ができたら、「実行」を選択します。

   ![A screenshot of the "Review your pipeline YAML" page.  An arrow points at the Run button](media/hol-2019-10-02_07-33-16.png)

<!-- 6. Azure DevOps will queue your first build and execute the pipeline when an agent becomes available. -->
6. Azure DevOpsは最初のビルドをキューに入れ、エージェントが利用可能になるとパイプラインを実行します。

   ![A screenshot of Azure DevOps Pipeline with a queued job.](media/hol-2019-10-02_07-39-24.png)

<!-- 7. The build should take about five minutes to complete. -->
7. ビルドが完了するまでに約5分かかります。

   ![A screenshot of Azure DevOps Pipeline with a completed job.](media/hol-2019-10-02_08-28-49.png)

   <!-- > **Note**: The build may fail due to an authorization error related to the Docker Registry Service connection. If this is the case, then select "Authorize Resources" and run the build again. -->
   > **注**：Docker Registry Service接続に関連する認証エラーが原因でビルドが失敗する場合があります。この場合は、[リソースの承認]を選択して、ビルドを再度実行してください。
   >
   > ![A screenshot showing an authorization failure error. An arrow points to the Authorize Resources button.](media/hol-2019-10-02_07-30-37.png)

8. Next, create the `content-api` build. Select the `content-api` repository.This repository already includes `azure-pipelines.yaml`. Choose 'Set up Build'.
8. 次に、 `content-api`ビルドを作成します。 `content-api`リポジトリを選択します。このリポジトリにはすでに` azure-pipelines.yaml`が含まれています。 「ビルドの設定」を選択します。

<!-- 9. In the "Review your pipeline YAML" step, edit the `containerRegistryName` value to replace `[SHORT_SUFFIX]` with your own three-letter suffix so that it matches your container registry's name. -->
9. 「パイプラインYAMLを確認する」ステップで、 `containerRegistryName`の値を編集して、` [SHORT_SUFFIX] `を独自の3文字のサフィックスに置き換えて、コンテナーレジストリの名前と一致させます。

   ![A screenshot of the "Review your pipeline YAML" step, with the containerRegistryName property highlighted.](media/hol-2019-10-18_06-32-34.png)

<!-- 10. When you are finished editing, select `Run` to execute the pipeline. -->
10. 編集が終了したら、[実行]を選択してパイプラインを実行します。

<!-- 11. While the `content-api` build runs, setup one last build for `content-init` by following the same steps as the previous `content-api` build, remembering to update the `[SHORT_SUFFIX]` value on the "Review your pipeline YAML" step. -->
11. `content-api`ビルドの実行中に、前の` content-api`ビルドと同じ手順に従って、 `content-init`の最後のビルドを1つセットアップします。その際 `[SHORT_SUFFIX]`値を必ず更新してください。

<!-- 12. Visit your ACR instance in the Azure portal, you should see new containers tagged with the Azure DevOps build number. -->
12. AzureポータルでACRインスタンスにアクセスすると、Azure DevOpsビルド番号でタグ付けされた新しいコンテナーが表示されます。

    ![A screenshot of the container images in ACR.](media/Ex1-Task7.28.png)

<!-- ## Exercise 2: Deploy the solution to Azure Kubernetes Service -->
## 演習2：Azure Kubernetes Serviceにソリューションをデプロイする

<!-- **Duration**: 30 minutes -->
**作業時間**：30分

<!-- In this exercise, you will connect to the Azure Kubernetes Service cluster you created before the hands-on lab and deploy the Docker application to the cluster using Kubernetes. -->
この演習では、ハンズオンラボの前に作成したAzure Kubernetes Serviceクラスターに接続し、Kubernetesを使用してDockerアプリケーションをクラスターにデプロイします。

<!-- ### Task 1: Tunnel into the Azure Kubernetes Service cluster -->
### Task1：Azure Kubernetes Serviceクラスターにトンネル接続する

<!-- In this task, you will gather the information you need about your Azure Kubernetes Service cluster to connect to the cluster and execute commands to connect to the Kubernetes management dashboard from cloud shell. -->
このタスクでは、クラスターに接続するためにAzure Kubernetes Serviceクラスターに必要な情報を収集し、Cloud ShellからKubernetes管理ダッシュボードに接続するコマンドを実行します。

<!-- > **Note**: The following tasks should be executed in cloud shell and not the build machine, so disconnect from build machine if still connected -->
> **注**：次のタスクはビルドマシンではなくCloud Shellで実行する必要があるため、もし接続されている場合はビルドマシンから切断します。

<!-- 1. Verify that you are connected to the correct subscription with the following command to show your default subscription: -->
1. 次のコマンドを使用して正しいサブスクリプションに接続していることを確認し、デフォルトのサブスクリプションを表示します。

   ```bash
   az account show
   ```

   <!-- - If you are not connected to the correct subscription, list your subscriptions and then set the subscription by its id with the following commands (similar to what you did in cloud shell before the lab): -->
   - 正しいサブスクリプションに接続していない場合は、サブスクリプションを一覧表示し、次のコマンドを使用してサブスクリプションを設定します。

   ```bash
   az account list
   az account set --subscription {id}
   ```

<!-- 2. Configure kubectl to connect to the Kubernetes cluster: -->
2. Kuberctlを構成して、Kubernetesクラスタに接続します。

   ```bash
   az aks get-credentials --name fabmedical-SUFFIX --resource-group fabmedical-SUFFIX
   ```

<!-- 3. Test that the configuration is correct by running a simple kubectl command to produce a list of nodes: -->
3. 簡単なkubectlコマンドを実行してノードの一覧を作成し、構成が正しいことを確認します。

   ```bash
   kubectl get nodes
   ```

   ![In this screenshot of the console, kubectl get nodes has been typed and run at the command prompt, which produces a list of nodes.](media/image75.png)

<!-- 4. Since the AKS cluster uses RBAC, a ClusterRoleBinding must be created before you can correctly access the dashboard. To create the required binding, execute the command below: -->
4. AKSクラスターはRBACを使用するため、ダッシュボードに正しくアクセスする前にClusterRoleBindingを作成する必要があります。必要なバインディングを作成するには、次のコマンドを実行します。

   ```bash
   kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
   ```

<!-- 5. Create an SSH tunnel linking a local port (8001) on your cloud shell host to port 443 on the management node of the cluster. Cloud shell will then use the web preview feature to give you remote access to the Kubernetes dashboard. Execute the command below replacing the values as follows: -->
5. Cloud Shellのlocal port（8001）をクラスターのMasterノードの443ポートにリンクするSSHトンネルを作成します。 Cloud ShellはWebプレビュー機能を使用して、Kubernetesダッシュボードへのリモートアクセスを提供します。次のように値を置き換えて、以下のコマンドを実行します。

   <!-- > **Note**: After you run this command, it may work at first and later lose its connection, so you may have to run this again to reestablish the connection. If the Kubernetes dashboard becomes unresponsive in the browser this is an indication to return here and check your tunnel or rerun the command. -->
   > **注**：このコマンドを実行すると、最初は機能しますが、その後接続が失われる可能性があります。接続を再確立するためにはコマンドを再度実行する必要があります。ブラウザでKubernetesダッシュボードが応答しなくなった場合は、ここに戻ってトンネルを確認するか、コマンドを再実行してください。

   ```bash
   az aks browse --name fabmedical-SUFFIX --resource-group fabmedical-SUFFIX
   ```

   ![In this screenshot of the console, the output of the above command produces output similar to the following: Password for private key: Proxy running on 127.0.0.1:8001/ui Press CTRL+C to close the tunnel ... Starting to server on 127.0.0.1:8001.](media/image76.png)

<!-- 6. If the tunnel is successful, you will see the Kubernetes management dashboard. -->
6. トンネリングが成功すると、Kubernetes管理ダッシュボードが表示されます。

   ![This is a screenshot of the Kubernetes management dashboard. Overview is highlighted on the left, and at right, kubernetes has a green check mark next to it. Below that, default-token-s6kmc is listed under Secrets.](media/image77.png)

   <!-- > **Note**: If the tunnel is not successful (if a JSON output is displayed), execute the command below and then return to task 5 above: -->
   > **注**：トンネルが成功しない場合（JSON出力が表示される場合）、以下のコマンドを実行してから、上記のStep 5に戻ります。
   >
   > ```bash
   > az extension add --name aks-preview
   > ```

<!-- ### Task 2: Deploy a service using the Kubernetes management dashboard -->
### Task2：Kubernetes管理ダッシュボードを使用してサービスをデプロイする

<!-- In this task, you will deploy the API application to the Azure Kubernetes Service cluster using the Kubernetes dashboard. -->
このタスクでは、Kubernetesダッシュボードを使用して、APIアプリケーションをAzure Kubernetes Serviceクラスターにデプロイします。

<!-- 1. From the Kubernetes dashboard, select Create in the top right corner. -->
1. Kubernetesダッシュボードの右上隅にある[作成]を選択します。

<!-- 2. From the Resource creation view, select Create an App. -->
2. [リソースの作成]ビューから、[アプリの作成]を選択します。

   ![This is a screenshot of the Deploy a Containerized App dialog box. Specify app details below is selected, and the fields have been filled in with the information that follows. At the bottom of the dialog box is a SHOW ADVANCED OPTIONS link.](media/image78.png)

   <!-- - Enter "api" for the App name. -->
   - アプリ名に「api」と入力します。

   <!-- - Enter [LOGINSERVER]/content-api for the Container Image, replacing [LOGINSERVER] with your ACR login server, such as fabmedicalsol.azurecr.io. -->
   - コンテナーイメージの[LOGINSERVER]/content-apiを入力します。[LOGINSERVER]は、fabmedicalsol.azurecr.ioなどのACRログインサーバーに置き換えます。

   <!-- - Set Number of pods to 1. -->
   - ポッドの数を1に設定します。

   <!-- - Set Service to "Internal". -->
   - サービスを「Internal」に設定します。

   <!-- - Use 3001 for Port and 3001 for Target port. -->
   - Portには3001を、TargetPortには3001を設定します。

<!-- 3. Select **SHOW ADVANCED OPTIONS** -->
3. [**詳細オプションを表示**]を選択します

   <!-- - Enter 0.125 for the CPU requirement. -->
   - CPU requirementとして0.125を入力します。

   - Enter 128 for the Memory requirement.
   - Memory requirementとして128を入力します。

   ![In the Advanced options dialog box, the above information has been entered. At the bottom of the dialog box is a Deploy button.](media/image79.png)

<!-- 4. Select Deploy to initiate the service deployment based on the image. This can take a few minutes. In the meantime, you will be redirected to the Overview dashboard. Select the API deployment from the Overview dashboard to see the deployment in progress. -->
4. イメージに基づいてサービスの展開を開始するには、[deploy]を選択します。これには数分かかる場合があります。それまでの間、ダッシュボードにリダイレクトされます。ダッシュボードからAPIデプロイメントを選択して、進行中のデプロイメントを確認します。

   ![This is a screenshot of the Kubernetes management dashboard. Overview is highlighted on the left, and at right, a red arrow points to the api deployment.](media/image80.png)

<!-- 5. Kubernetes indicates a problem with the api Replica Set after some seconds. Select the log icon to investigate. -->
5. Kubernetesは、数秒後にレプリカセットに問題があることを示しています。ここで調査するログアイコンを選択します。

   ![This screenshot of the Kubernetes management dashboard shows an error with the replica set.](media/Ex2-Task1.5.png)

<!-- 6. The log indicates that the content-api application is once again failing because it cannot find a mongodb instance to communicate with. You will resolve this issue by migrating your data workload to Cosmos DB. -->
6. ログは、通信するmongodbインスタンスが見つからないため、content-apiアプリケーションが再び失敗していることを示しています。この問題は、データワークロードをCosmos DBに移行することで解決します。

   ![This screenshot of the Kubernetes management dashboard shows logs output for the api container.](media/Ex2-Task1.6.png)

<!-- 7. Open the Azure portal in your browser and navigate to your resource group and find your Cosmos DB resource. Select the Cosmos DB resource to view details. -->
7. ブラウザーでAzureポータルを開き、リソースグループに移動して、Cosmos DBリソースを見つけます。詳細を表示するには、Cosmos DBリソースを選択します。

   ![A screenshot of the Azure Portal showing the Cosmos DB among existing resources.](media/Ex2-Task1.9.png)

<!-- 8. Under "Quick Start" select the "Node.js" tab and copy the Node 3.0 connection string. -->
8. [クイックスタート]で[Node.js]タブを選択し、Node 3.0の接続文字列をコピーします。

   ![A screenshot of the Azure Portal showing the quick start for setting up Cosmos DB with MongoDB API.](media/Ex2-Task1.10.png)

<!-- 9. Update the provided connection string with a database "contentdb" and a replica set "globaldb". -->
9. 提供された接続文字列をデータベース「contentdb」とレプリカセット「globaldb」で更新します。

   > **Note**: Username and password redacted for brevity.

   ```text
   mongodb://<USERNAME>:<PASSWORD>@fabmedical-<SUFFIX>.documents.azure.com:10255/contentdb?ssl=true&replicaSet=globaldb
   ```

<!-- 10. To avoid disconnecting from the Kubernetes dashboard, open a **new** Azure Cloud Shell console. -->
10. ここでKubernetesダッシュボードから切断されないように、**新しい** Azure Cloud Shellコンソールを開きます。

    ![A screenshot of the cloud shell window with a red arrow pointing at the "Open new session" button on the toolbar.](media/hol-2019-10-19_06-13-34.png)

<!-- 11. You will setup a Kubernetes secret to store the connection string and configure the content-api application to access the secret. First, you must base64 encode the secret value. Open your Azure Cloud Shell window and use the following command to encode the connection string and then, copy the output. -->
11. 接続文字列を格納するKubernetesシークレットを設定し、シークレットにアクセスするようにcontent-apiアプリケーションを構成します。まず、シークレットの値をbase64エンコードする必要があります。Cloud Shellウィンドウを開き、次のコマンドを使用して接続文字列をエンコードして、出力をコピーします。

    <!-- > **Note**: Double quote marks surrounding the connection string are required to successfully produce the required output. -->
    > **注**：必要な出力を正常に生成するには、接続文字列を囲む二重引用符が必要です。

    ```bash
    echo -n "[CONNECTION STRING VALUE]" | base64 -w 0 - | echo $(</dev/stdin)
    ```

    ![A screenshot of the Azure cloud shell window showing the command to create the base64 encoded secret.  The output to copy is highlighted.](media/hol-2019-10-18_07-12-13.png)

<!-- 12. Return to the Kubernetes UI in your browser and select "+ Create". Update the following YAML with the encoded connection string from your clipboard, paste the YAML data into the create dialog, and choose "Upload". -->
12. ブラウザでKubernetes UIに戻り、[Create]を選択します。クリップボードのエンコードされた接続文字列を次のYAMLに更新し、YAMLデータを作成ダイアログに貼り付けて、[アップロード]を選択します。

    ```yaml
    apiVersion: v1
    kind: Secret
    metadata:
      name: mongodb
    type: Opaque
    data:
      db: <base64 encoded value>
    ```

    ![A screenshot of the Kubernetes management dashboard showing the YAML file for creating a deployment.](media/Ex2-Task1.13.png)

<!-- 13. Scroll down in the Kubernetes dashboard until you can see "Secrets" in the left-hand menu. Select it. -->
13. 左側のメニューに「Secret」が表示されるまで、Kubernetesダッシュボードを下にスクロールします。それを選択します。

    ![A screenshot of the Kubernetes management dashboard showing secrets.](media/Ex2-Task1.14.png)

<!-- 14. View the details for the "mongodb" secret. Select the eyeball icon to show the secret. -->
14. "mongodb"シークレットの詳細を表示します。シークレットを表示すために眼球アイコンを選択します。

    ![A screenshot of the Kubernetes management dashboard showing the value of a secret.](media/Ex2-Task1.15.png)

<!-- 15. Next, download the api deployment configuration using the following command in your Azure Cloud Shell window: -->
15. 次に、Azure Cloud Shellウィンドウで次のコマンドを使用して、デプロイメント構成をダウンロードします。

    ```bash
    kubectl get -o=yaml --export=true deployment api > api.deployment.yml
    ```

<!-- 16. Edit the downloaded file using cloud shell code editor: -->
16. ダウンロードしたファイルをCloud Shellのコードエディターを使用して編集します。

    ```bash
    code api.deployment.yml
    ```

    <!-- Add the following environment configuration to the container spec, below the "image" property: -->
   次の環境設定を「image」プロパティの下のコンテナ仕様に追加します。インデントに注意してください。

    ```yaml
      env:
        - name: MONGODB_CONNECTION
          valueFrom:
            secretKeyRef:
              name: mongodb
              key: db
    ```

    ![A screenshot of the Kubernetes management dashboard showing part of the deployment file.](media/Ex2-Task1.17.png)

<!-- 17. Save your changes and close the editor. -->
17. 変更を保存してエディターを閉じます。

    ![A screenshot of the code editor save and close actions.](media/Ex2-Task1.17.1.png)

<!-- 18. Update the api deployment by using `kubectl` to apply the new configuration. -->
18. kubectlコマンドを使用してapiデプロイメントを更新し、新しい構成をクラスターに適用します。

    ```bash
    kubectl apply -f api.deployment.yml
    ```

<!-- 19. Select "Deployments" then "api" to view the api deployment. It now has a healthy instance and the logs indicate it has connected to mongodb. -->
19.「Deployments」-「api」の順に選択して、apiデプロイメントを表示します。現在は正常なインスタンスがあり、ログはmongodbに接続したことを示しています。

    ![A screenshot of the Kubernetes management dashboard showing logs output.](media/Ex2-Task1.19.png)

<!-- ### Task 3: Deploy a service using kubectl -->
### Task3：kubectlを使用してサービスをデプロイする

<!-- In this task, deploy the web service using `kubectl`. -->
このタスクでは、`kubectl`コマンドを使用してWebサービスをデプロイします。

<!-- 1. Open a **new** Azure Cloud Shell console. -->
1. **新しい** Azure Cloud Shellコンソールを開きます。

<!-- 2. Create a text file called web.deployment.yml using the Azure Cloud Shell Editer-->
2. Azure Cloud Shellを使用して、web.deployment.ymlというテキストファイルを作成します

   ```bash
   code web.deployment.yml
   ```

<!-- 3. Copy and paste the following text into the editor: -->
3. 次のテキストをコピーしてエディターに貼り付けます。

   <!-- > **Note**: Be sure to copy and paste only the contents of the code block carefully to avoid introducing any special characters. -->
   > **注**：特殊文字が導入されないように、コードブロックの内容のみをコピーして貼り付けてください。

   ```yaml
   apiVersion: extensions/v1beta1
   kind: Deployment
   metadata:
     labels:
         app: web
     name: web
   spec:
     replicas: 1
     selector:
         matchLabels:
           app: web
     strategy:
         rollingUpdate:
           maxSurge: 1
           maxUnavailable: 1
         type: RollingUpdate
     template:
         metadata:
           labels:
               app: web
           name: web
         spec:
           containers:
           - image: [LOGINSERVER].azurecr.io/content-web
             env:
               - name: CONTENT_API_URL
                 value: http://api:3001
             livenessProbe:
               httpGet:
                   path: /
                   port: 3000
               initialDelaySeconds: 30
               periodSeconds: 20
               timeoutSeconds: 10
               failureThreshold: 3
             imagePullPolicy: Always
             name: web
             ports:
               - containerPort: 3000
                 hostPort: 80
                 protocol: TCP
             resources:
               requests:
                   cpu: 1000m
                   memory: 128Mi
             securityContext:
               privileged: false
             terminationMessagePath: /dev/termination-log
             terminationMessagePolicy: File
           dnsPolicy: ClusterFirst
           restartPolicy: Always
           schedulerName: default-scheduler
           securityContext: {}
           terminationGracePeriodSeconds: 30
   ```

<!-- 4. Update the [LOGINSERVER] entry to match the name of your ACR login server. -->
4. [LOGINSERVER]エントリを更新して、ACRログインサーバーの名前と一致させます。

<!-- 5. Select the **...** button and choose **Save**. -->
5. [** ... **]ボタンを選択し、[**保存**]を選択します。

   ![In this screenshot of an Azure Cloud Shell editor window, the ... button has been selected and the Save option is highlighted.](media/b4-image62.png)

<!-- 6. Select the **...** button again and choose **Close Editor**. -->
6.もう一度[** ... **]ボタンを選択し、[**エディターを閉じる**]を選択します。

   ![In this screenshot of the Azure Cloud Shell editor window, the ... button has been selected and the Close Editor option is highlighted.](media/b4-image63.png)

<!-- 7. Create a text file called web.service.yml using the Azure Cloud Shell Editor. -->
7. Azure Cloud Shell エディターを使用して、web.service.ymlというテキストファイルを作成します。

   ```bash
   code web.service.yml
   ```

<!-- 8. Copy and paste the following text into the editor: -->
8. 次のテキストをコピーしてエディターに貼り付けます。

   <!-- > **Note**: Be sure to copy and paste only the contents of the code block carefully to avoid introducing any special characters. -->
   > **注**：特殊文字が導入されないように、コードブロックの内容のみをコピーして貼り付けてください。

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     labels:
       app: web
     name: web
   spec:
     ports:
       - name: web-traffic
         port: 80
         protocol: TCP
         targetPort: 3000
     selector:
       app: web
     sessionAffinity: None
     type: LoadBalancer
   ```

<!-- 9. Save changes and close the editor. -->
9. 変更を保存してエディターを閉じます。

<!-- 10. Type the following command to deploy the application described by the YAML files. You will receive a message indicating the items kubectl has created a web deployment and a web service. -->
10. 次のコマンドを入力して、YAMLファイルで記述されたアプリケーションをデプロイします。 kubectlがDeploymentとServiceを作成したことを示すメッセージが表示されます。

    ```bash
    kubectl create --save-config=true -f web.deployment.yml -f web.service.yml
    ```

    ![In this screenshot of the console, kubectl apply -f kubernetes-web.yaml has been typed and run at the command prompt. Messages about web deployment and web service creation appear below.](media/image93.png)

<!-- 11. Return to the browser where you have the Kubernetes management dashboard open. From the navigation menu, select Services view under Discovery and Load Balancing. From the Services view, select the web service, and from this view, you will see the web service deploying. This deployment can take a few minutes. When it completes, you should be able to access the website via an external endpoint. -->
11. Kubernetes管理ダッシュボードを開いているブラウザーに戻ります。ナビゲーションメニューの[Discovery and Load Balancing]で[Service]ビューを選択します。[Service]ビューからWebサービスを選択します。このビューから、Webサービスのデプロイが表示されます。このDeploymentには数分かかる場合があります。完了すると、外部エンドポイントを介してWebサイトにアクセスできるようになります。

    ![In the Kubernetes management dashboard, Services is selected below Discovery and Load Balancing in the navigation menu. At right are three boxes that display various information about the web service deployment: Details, Pods, and Events. At this time, we are unable to capture all of the information in the window. Future versions of this course should address this.](media/image94.png)

<!-- 12. Select the speakers and sessions links. Note that no data is displayed, although we have connected to our Cosmos DB instance, there is no data loaded. You will resolve this by running the content-init application as a Kubernetes Job in Task 5. -->
12.スピーカーとセッションのリンクを選択します。 Cosmos DBインスタンスに接続していますが、データは表示されていないことに注意してください。これを解決するには、Step 5でcontent-initアプリケーションをKubernetesジョブとして実行します。

    ![A screenshot of the web site showing no data displayed.](media/Ex2-Task3.11.png)

<!-- ### Task 4: Deploy a service using a Helm chart -->
### Task4：Helmチャートを使用してサービスをデプロイする

<!-- In this task, deploy the web service using a helm chart. -->
このタスクでは、ヘルムチャートを使用してWebサービスをデプロイします。

<!-- 1. From the Kubernetes dashboard, under "Workloads", select "Deployments". -->
1. Kubernetesダッシュボードの[Workloads]で、[Deployments]を選択します。

<!-- 2. Select the triple vertical dots on the right of the "web" deployment and then choose "Delete". When prompted, select "Delete" again. -->
2.「web」デプロイメントの右側にある縦に並んだ3つの点を選択し、「Delete」を選択します。プロンプトが表示されたら、もう一度[Delete]を選択します。

   ![A screenshot of the Kubernetes management dashboard showing how to delete a deployment.](media/Ex2-Task4.2.png)

<!-- 3. From the Kubernetes dashboard, under "Discovery and Load Balancing", select "Services". -->
3. Kubernetesダッシュボードの[Discovery and Load Balancing]で、[Services]を選択します。

<!-- 4. Select the triple vertical dots on the right of the "web" service and then choose "Delete". When prompted, select "Delete" again. -->
4.「web」サービスの右側にある縦3つの点を選択し、「Delete」を選択します。プロンプトが表示されたら、もう一度[Delete]を選択します。

   ![A screenshot of the Kubernetes management dashboard showing how to delete a deployment.](media/Ex2-Task4.4.png)

<!-- 5. Open a **new** Azure Cloud Shell console. -->
5. **新しい** Azure Cloud Shellコンソールを開きます。

<!-- 6. Update your starter files by pulling the latest changes from Azure DevOps -->
6. Azure DevOpsから最新の変更をプルして、サンプルファイルを更新します。

   ```bash
    cd ~/MCW-Cloud-native-applications/Hands-on\ lab/lab-files/developer/content-web
    git pull
   ```

<!-- 7. We will use the chart scaffold implementation that we have available in the source code. Use the following commands to access the chart folder: -->
7. ソースコードで利用可能なchartを使用します。次のコマンドを使用して、chartのフォルダにアクセスします。

    ```bash
    cd ~/MCW-Cloud-native-applications/Hands-on\ lab/lab-files/infrastructure/content-web/charts
    ```

<!-- 8. We now need to update the generated scaffold to match our requirements. We will first update the file named `values.yaml`. -->
8. 次に、生成されたscaffoldを要件に一致するように更新する必要があります。まず、 `values.yaml`という名前のファイルを更新します。

    ```bash
    cd web
    code values.yaml
    ```

<!-- 9. Search for the `image` definition and update the values so that they match the following: -->
9. `image`定義を探し、値が以下と一致するように値を更新します。

    ```yaml
    image:
      repository: [LOGINSERVER].azurecr.io/content-web
      pullPolicy: Always
    ```

<!-- 10. Search for `nameOverride` and `fullnameOverride` entries and update the values so that they match the following: -->
10. `nameOverride`および` fullnameOverride`エントリを検索し、次のように値が更新されるようにします。

    ```yaml
    nameOverride: "web"
    fullnameOverride: "web"
    ```

<!-- 11. Search for the `service` definition and update the values so that they match the following: -->
11. `service`定義を検索し、値が次のようになるように更新します。

    ```yaml
    service:
      type: LoadBalancer
      port: 80
    ```

<!-- 12. Search for the `resources` definition and update the values so that they match the following: -->
12. `resources`定義を検索し、値が以下と一致するように値を更新します。

    ```yaml
    resources:
      # We usually recommend not to specify default resources and to leave this as a conscious
      # choice for the user. This also increases chances charts run on environments with little
      # resources, such as Minikube. If you do want to specify resources, uncomment the following
      # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
      # limits:
      #  cpu: 100m
      #  memory: 128Mi
      requests:
        cpu: 1000m
        memory: 128Mi
    ```

<!-- 13. Save changes and close the editor. -->
13. 変更を保存してエディターを閉じます。

<!-- 14. We will now update the file named `Chart.yaml`. -->
14. `Chart.yaml`という名前のファイルを更新します。

    ```bash
    code Chart.yaml
    ```

<!-- 15. Search for the `appVersion` entry and update the value so that it matches the following: -->
15. `appVersion`エントリを検索し、次のように値を更新します。

    ```yaml
    appVersion: latest
    ```

<!-- 16. We will now update the file named `deployment.yaml`. -->
16. `deployment.yaml`という名前のファイルを更新します。

    ```bash
    cd templates
    code deployment.yaml
    ```

<!-- 17. Search for the `metadata` definition and update the values so that they match the following: -->
17. `metadata`定義を検索し、値が以下と一致するように値を更新します。

    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      (...)
    spec:
      (...)
      template:
        metadata:
          (...)
          annotations:
            rollme: {{ randAlphaNum 5 | quote }}
    ```

<!-- 18. Search for the `containers` definition and update the values so that they match the following: -->
18. `containers`定義を検索し、値が次のようになるように更新します。

    ```yaml
    containers:
      - name: {{ .Chart.Name }}
        securityContext:
          {{- toYaml .Values.securityContext | nindent 12 }}
        image: "{{ .Values.image.repository }}:{{ .Chart.AppVersion }}"
        imagePullPolicy: {{ .Values.image.pullPolicy }}
        ports:
          - name: http
            containerPort: 3000
            protocol: TCP
        env:
          - name: CONTENT_API_URL
            value: http://api:3001
        livenessProbe:
          httpGet:
            path: /
            port: 3000
    ```

<!-- 19. Save changes and close the editor. -->
19. 変更を保存してエディターを閉じます。

<!-- 20. We will now update the file named `service.yaml`. -->
20. `service.yaml`という名前のファイルを更新します。

    ```bash
    code service.yaml
    ```

<!-- 21. Search for the `ports` definition and update the values so that they match the following: -->
21. `ports`定義を検索し、値が次のようになるように更新します。

    ```yaml
    ports:
      - port: {{ .Values.service.port }}
        targetPort: 3000
        protocol: TCP
        name: http
    ```

<!-- 22. Save changes and close the editor. -->
22. 変更を保存してエディターを閉じます。

<!-- 23. The chart is now setup to run our web container. Type the following command to deploy the application described by the YAML files. You will receive a message indicating that helm has created a web deployment and a web service. -->
23. これで、helm chartがセットアップされ、Webコンテナーが実行されます。次のコマンドを入力して、YAMLファイルで記述されたアプリケーションをデプロイします。 helmがWebデプロイメントとWebサービスを作成したことを示すメッセージが表示されます。

    ```bash
    cd ../..
    helm install web ./web
    ```

    ![In this screenshot of the console, helm install web ./web has been typed and run at the command prompt. Messages about web deployment and web service creation appear below.](media/Ex2-Task4.24.png)

<!-- 24. Return to the browser where you have the Kubernetes management dashboard open. From the navigation menu, select Services view under Discovery and Load Balancing. From the Services view, select the web service, and from this view, you will see the web service deploying. This deployment can take a few minutes. When it completes, you should be able to access the website via an external endpoint. -->
24. Kubernetes管理ダッシュボードを開いているブラウザーに戻ります。ナビゲーションメニューの[Discovery and Load Balancing]で[Service
]ビューを選択します。 「Service」ビューからWebサービスを選択します。このビューから、Webサービスのデプロイが表示されます。この展開には数分かかる場合があります。完了すると、外部エンドポイントを介してWebサイトにアクセスできるようになります。

    ![In the Kubernetes management dashboard, Services is selected below Discovery and Load Balancing in the navigation menu. At right are three boxes that display various information about the web service deployment: Details, Pods, and Events. "External endpoints" is highlighted to show that an external endpoint has been created.](media/image94.png)

<!-- 25. Select the speakers and sessions links. Note that no data is displayed, although we have connected to our Cosmos DB instance, there is no data loaded. You will resolve this by running the content-init application as a Kubernetes Job. -->
25. SpeakerとSessionのリンクを選択します。 Cosmos DBインスタンスに接続していますが、データは表示されていないことに注意してください。これを解決するには、テストデータを挿入するcontent-initアプリケーションをKubernetesジョブとして実行します。

    ![A screenshot of the web site showing no data displayed.](media/Ex2-Task3.11.png)

<!-- 26. We will now persist the changes into the repository. Execute the following commands: -->
26. 変更をリポジトリに永続化します。次のコマンドを実行します。

    ```bash
    cd ..
    git pull
    git add charts/
    git commit -m "Helm chart update."
    git push
    ```

<!-- ### Task 5: Initialize database with a Kubernetes Job -->
### Task5：Kubernetes JobでCosmos DBを初期化する

<!-- In this task, you will use a Kubernetes Job to run a container that is meant to execute a task and terminate, rather than run all the time. -->
このタスクでは、Kubernetesジョブを使用して、常に実行するのではなく、タスクを実行して終了するためのコンテナを実行します。

<!-- 1. Create a text file called init.job.yml using the Azure Cloud Shell Editor. -->
1. Azure Cloud Shell コードエディターを使用して、init.job.ymlというテキストファイルを作成します。

   ```bash
   code init.job.yml
   ```

<!-- 2. Copy and paste the following text into the editor: -->
2. 次のテキストをコピーしてエディターに貼り付けます。

   <!-- > **Note**: Be sure to copy and paste only the contents of the code block carefully to avoid introducing any special characters. -->
   > **注**：特殊文字が導入されないように、コードブロックの内容のみをコピーして貼り付けてください。

   ```yaml
   apiVersion: batch/v1
   kind: Job
   metadata:
     name: init
   spec:
     template:
       spec:
         containers:
         - name: init
           image: [LOGINSERVER]/content-init
           env:
             - name: MONGODB_CONNECTION
               valueFrom:
                 secretKeyRef:
                   name: mongodb
                   key: db
         restartPolicy: Never
     backoffLimit: 4
   ```

<!-- 3. Edit this file and update the [LOGINSERVER] entry to match the name of your ACR login server. -->
3. このファイルを編集し、[LOGINSERVER]エントリを更新して、ACRログインサーバーの名前と一致させます。

<!-- 4. Save changes and close the editor. -->
4. 変更を保存してエディターを閉じます。

<!-- 5. Type the following command to deploy the job described by the YAML. You will receive a message indicating the kubectl has created an init "job.batch". -->
5. 次のコマンドを入力して、YAMLで記述されたジョブをデプロイします。 kubectlがJobを作成したことを示すメッセージが表示されます。

   ```bash
   kubectl create --save-config=true -f init.job.yml
   ```

<!-- 6. View the Job by selecting "Jobs" under "Workloads" in the Kubernetes UI. -->
6. Kubernetes UIの[Workloads]で[Jobs]を選択してジョブを表示します。

   ![A screenshot of the Kubernetes management dashboard showing jobs.](media/Ex2-Task5.6.png)

<!-- 7. Select the log icon to view the logs. -->
7. ログアイコンを選択して、ログを表示します。

   ![A screenshot of the Kubernetes management dashboard showing log output.](media/Ex2-Task5.7.png)

<!-- 8. Next view your Cosmos DB instance in the Azure portal and see that it now contains two collections. -->
8. 次に、AzureポータルでCosmos DBインスタンスを表示し、2つのコレクションが含まれていることを確認します。

   ![A screenshot of the Azure Portal showing Cosmos DB collections.](media/Ex2-Task5.8.png)

<!-- ### Task 6: Test the application in a browser -->
### Task6：ブラウザーでアプリケーションをテストする

<!-- In this task, you will verify that you can browse to the web service you have deployed and view the speaker and content information exposed by the API service. -->
このタスクでは、デプロイしたWebサービスを参照し、APIサービスによって公開されたSpeakerとContentsを表示できることを確認します。

<!-- 1. From the Kubernetes management dashboard, in the navigation menu, select the Services view under Discovery and Load Balancing. -->
1. Kubernetes管理ダッシュボードのナビゲーションメニューで、[Discovery and Load Balancing]の[Service]ビューを選択します。

<!-- 2. In the list of services, locate the external endpoint for the web service and select this hyperlink to launch the application. -->
2. Serviceの一覧で、Webサービスのエンドポイントのハイパーリンクをクリックしてアプリケーションを起動します。

   ![In the Services box, the hyperlinked external endpoint for the web service is highlighted.](media/image112.png)

<!-- 3. You will see the web application in your browser and be able to select the Speakers and Sessions links to view those pages without errors. The lack of errors means that the web application is correctly calling the API service to show the details on each of those pages. -->
3. ブラウザにWebアプリケーションが表示され、[Speaker]および[Session]リンクを選択して、エラーなしでこれらのページを表示できます。エラーがないことは、WebアプリケーションがAPIサービスを正しく呼び出して、それらの各ページの詳細を表示していることを意味します。

   ![In this screenshot of the Contoso Neuro 2017 web application, Speakers has been selected, and sample speaker information appears at the bottom.](media/image114.png)

   ![In this screenshot of the Contoso Neuro 2017 web application, Sessions has been selected, and sample session information appears at the bottom.](media/image115.png)

<!-- ### Task 7: Configure Continuous Delivery to the Kubernetes Cluster -->
### Task7：Kubernetesクラスターへの継続的デリバリーを構成する

<!-- In this task, you will use Azure DevOps to automate the process for deploying the web image to the AKS cluster. You will update the DevOps Pipeline and configure a deployment stage so that when new images are pushed to the ACR, the pipeline deploys the image to the AKS cluster. -->
このタスクでは、Azure DevOpsを使用して、WebイメージをAKSクラスターにデプロイするプロセスを自動化します。新しいイメージがACRにプッシュされたときにパイプラインがAKSクラスターに展開するように、DevOpsパイプラインを更新してデプロイステージを構成します。

<!-- 1. Login to your Azure DevOps account, access the `fabmedical` project you created earlier, then select "Pipelines". -->
1. Azure DevOpsアカウントにログインし、前に作成した `fabmedical`プロジェクトにアクセスして、[Pipelines]を選択します。

<!-- 2. From the pipelines list, select the `content-web` pipeline and select `Edit.` -->
2. パイプラインリストから[content-web]パイプラインを選択し、[Edit]を選択します。

   ![A screenshot with the `content-web` pipeline selected and the `Edit` button highlighted.](media/hol-2019-10-02_10-06-57.png)

<!-- 3. You will add a second job to the `Build and Push` stage, below the existing `Docker` job. Paste the following into the pipeline editor: -->
3. 既存の `Docker`ジョブの下にある2番目のジョブを` Build and Push`ステージに追加します。以下をパイプラインエディターに貼り付けます。

   <!-- > **Note**: Be careful to check your indenting when pasting. The `job` node should be indented with 2 spaces and line up with the `job` node for the `Docker` job. -->
   > **注**：貼り付けるときは、インデントを確認してください。 `job`ノードは2つのスペースでインデントされ、` Docker`ジョブの `job`ノードと並ぶ必要があります。

   ```yaml
   - job: Helm
    displayName: Build and Push Helm Chart
    pool:
      vmImage: $(vmImageName)
    steps:
      - checkout: self
        fetchDepth: 1

      - task: HelmInstaller@1
        inputs:
          helmVersionToInstall: 'latest'
        displayName: 'Helm Install'

      - task: HelmDeploy@0
        inputs:
          connectionType: 'None'
          command: 'package'
          chartPath: 'charts/web'
          chartVersion: '$(Build.BuildNumber)'
          save: false
        displayName: 'Helm Package'

      - task: AzureCLI@1
        inputs:
          azureSubscription: 'azurecloud'
          scriptLocation: 'inlineScript'
          inlineScript: |
            set -euo pipefail

            az acr helm push \
              --name $(containerRegistryName) \
              $(Build.ArtifactStagingDirectory)/web-$(Build.BuildNumber).tgz

          failOnStandardError: true
        displayName: 'Helm Push'
   ```

   ![A screenshot that shows the new job, with a line to highlight proper indenting.](media/hol-2019-10-02_10-23-10.png)

<!-- 4. Choose "Save" and commit the changes directly to the master branch. A new build will start automatically. The two jobs are independent and will run in parallel if there are enough available build agents. -->
4. [Seve]を選択して、変更をマスターブランチに直接コミットします。新しいビルドが自動的に開始されます。 2つのジョブは独立しており、使用可能なビルドエージェントがある場合は並行して実行されます。

   ![A screenshot that shows the jobs, Helm is complete, Docker is still running](media/hol-2019-10-02_10-57-42.png)

<!-- 5. Now return to the pipeline editor to create a deployment stage. Paste the following into the pipeline editor and update the SUFFIX values: -->
5. 次にパイプラインエディターに戻り、デプロイメントステージを作成します。以下をパイプラインエディターに貼り付け、SUFFIX値を更新します。

   <!-- > **Note**: Be careful to check your indenting when pasting. The `stage` node should be indented with 0 spaces and line up with the `stage` node for the `Build` stage. -->
   > **注**：貼り付けるときは、インデントを確認してください。 `stage`ノードは0スペースでインデントされ、` Build`ステージの `stage`ノードと並んでいる必要があります。

   ```yaml
   - stage:
     displayName: AKS Deployment
     jobs:
       - deployment: DeployAKS
         displayName: "Deployment to AKS"
         pool:
           vmImage: $(vmImageName)
         environment: "aks"
         strategy:
           runOnce:
             deploy:
               steps:
                 - checkout: none

                 - task: HelmInstaller@1
                   inputs:
                     helmVersionToInstall: "latest"
                   displayName: "Helm Install"

                 - task: AzureCLI@1
                   inputs:
                     azureSubscription: "azurecloud"
                     scriptLocation: "inlineScript"
                     inlineScript: |
                       set -euo pipefail

                       az acr helm repo add --name $(containerRegistryName)

                     failOnStandardError: true
                   displayName: "Helm repo update"

                 - task: HelmDeploy@0
                   inputs:
                     connectionType: "Azure Resource Manager"
                     azureSubscription: "azurecloud"
                     azureResourceGroup: "fabmedical-[SUFFIX]"
                     kubernetesCluster: "fabmedical-[SUFFIX]"
                     command: "upgrade"
                     chartType: "Name"
                     chartName: "$(containerRegistryName)/web"
                     releaseName: "web"
                     overrideValues: "image.tag=$(Build.BuildNumber),image.repository=$(containerRegistry)/content-web"
                   displayName: "Helm Upgrade"
   ```

   ![A screenshot that shows the new stage, with a line to highlight proper indenting.](media/hol-2019-10-02_11-19-51.png)

<!-- 6. Select "Save" and commit the changes directly to the master branch. A new build will start automatically. The two jobs are independent and will run in parallel if there are enough available build agents. However, the deployment depends on the jobs and will wait for them to complete before starting. -->
6. [Save]を選択し、変更をマスターブランチに直接コミットします。新しいビルドが自動的に開始されます。 2つのジョブは独立しており、使用可能なビルドエージェントが十分にある場合は並行して実行されます。ただし、展開はジョブに依存し、ジョブが完了するのを待ってから開始されます。

   ![A screenshot that shows the stages, expanded to also show the jobs.  Docker is running, Helm is queued, AKS Deployment is not started.](media/hol-2019-10-02_11-27-34.png)

<!-- ### Task 8: Review Azure Monitor for Containers -->
### Task8：コンテナーのAzure Monitorを確認する

<!-- In this task, you will access and review the various logs and dashboards made available by Azure Monitor for Containers. -->
このタスクでは、Azure Monitor for Containersによって提供されるさまざまなログとダッシュボードにアクセスして確認します。

<!-- 1. From the Azure Portal, select the resource group you created named fabmedical-SUFFIX, and then select your AKS cluster. -->
1. Azure Portalから、作成したfabmedical-SUFFIXという名前のリソースグループを選択し、AKSクラスターを選択します。

   ![In this screenshot, the resource group was previously selected and the AKS cluster is selected.](media/Ex2-Task8.1.png)

<!-- 2. From the Monitoring blade, select **Insights**. -->
2. [Monitoring]ブレードで、[**Insights**]を選択します。

   ![In the Monitoring blade, Insights is highlighted.](media/Ex2-Task8.2.png)

<!-- 3. Review the various available dashboards and a deeper look at the various metrics and logs available on the Cluster, Cluster Nodes, Cluster Controllers, and deployed Containers. -->
3. さまざまなダッシュボードを確認し、クラスター、クラスターノード、クラスターコントローラー、およびデプロイされたコンテナーで利用可能なさまざまなメトリックとログを詳しく調べます。

   ![In this screenshot, the dashboards and blades are shown.](media/Ex2-Task8.3.png)

<!-- 4. To review the Containers dashboards and see more detailed information about each container, select the containers tab. -->
4. コンテナダッシュボードを確認し、各コンテナの詳細情報を表示するには、[Containers]タブを選択します。

   ![In this screenshot, the various container information is shown.](media/monitor_1.png)

<!-- 5. Now filter by container name and search for the web containers, you will see all the containers created in the Kubernetes cluster with the pod names. You can compare the names with those in the kubernetes dashboard. -->
5. コンテナー名でフィルターし、Webコンテナーを検索すると、Kubernetesクラスター内にポッド名で作成されたすべてのコンテナーが表示されます。kubernetesダッシュボードの名前と比較できます。

   ![In this screenshot, the containers are filtered by container named web.](media/monitor_3.png)

<!-- 6. By default, the CPU Usage metric will be selected displaying all cpu information for the selected container, to switch to another metric open the metric dropdown list and select a different metric. -->
6. デフォルトでは、CPU使用率メト​​リックが選択され、選択したコンテナのすべてのCPU情報が表示されます。別のメトリックに切り替えて、メトリックドロップダウンリストを開き、別のメトリックを選択します。

   ![In this screenshot, the various metric options are shown.](media/monitor_2.png)

<!-- 7. Upon selecting any pod, all the information related to the selected metric will be displayed on the right panel, and that would be the case when selecting any other metric, the details will be displayed on the right panel for the selected pod. -->
7. Podを選択すると、選択したメトリックに関連するすべての情報が右側のパネルに表示されます。他のメトリックを選択した場合は、選択したPodの詳細が右側のパネルに表示されます。

   ![In this screenshot, the pod cpu usage details are shown.](media/monitor_4.png)

<!-- 8. To display the logs for any container simply select it and view the right panel and you will find "View container logs" option which will list all logs for this specific container. -->
8. 任意のコンテナーのログを表示するには、コンテナーを選択して右側のパネルを表示するだけで、このコンテナーのすべてのログを一覧表示する[View container logs]オプションが表示されます。

   ![In the View in Analytics dropdown, the View container logs item is selected.](media/monitor_5.png)

   ![The container logs are displayed based on a query entered in the query window.](media/monitor_6.png)

<!-- 9. For each log entry you can display more information by expanding the log entry to view the below details. -->
9. 各ログエントリについて、ログエントリを展開して以下の詳細を表示することにより、より多くの情報を表示できます。

   ![The container log query results are displayed, one log entry is expanded in the results view with its details shown.](media/monitor_7.png)

<!-- ## Exercise 3: Scale the application and test HA -->
## 演習3：アプリケーションのスケーリングとHAのテスト

<!-- **Duration**: 20 minutes -->
**作業時間**：20分

<!-- At this point, you have deployed a single instance of the web and API service containers. In this exercise, you will increase the number of container instances for the web service and scale the front-end on the existing cluster. -->
ここまでの手順で、WebおよびAPIサービスコンテナの単一のインスタンスがデプロイされています。この演習では、Webサービスのコンテナーインスタンスの数を増やし、既存クラスターのフロントエンドをスケーリングします。

<!-- ### Task 1: Increase service instances from the Kubernetes dashboard -->
### Task1：Kubernetesダッシュボードからサービスインスタンスを増やす

<!-- In this task, you will increase the number of instances for the API deployment in the Kubernetes management dashboard. While it is deploying, you will observe the changing status. -->
このタスクでは、Kubernetes管理ダッシュボードでAPIデプロイのインスタンス数を増やします。デプロイ中はステータスの変化を観察します。

<!-- 1. From the navigation menu, select Workloads\>Deployments, and then select the API deployment. -->
1. ナビゲーションメニューから、[Workloads]> [Deployments]を選択し、次にAPIデプロイメントを選択します。

<!-- 2. Select SCALE. -->
2. [SCALE]を選択します。

   ![In the Workloads > Deployments > api bar, the Scale icon is highlighted.](media/image89.png)

<!-- 3. Change the number of pods to 2, and then select **OK**. -->
3. Podの数を2に変更し、[**OK**]を選択します。

   ![In the Scale a Deployment dialog box, 2 is entered in the Desired number of pods box.](media/image116.png)

   <!-- > **Note**: If the deployment completes quickly, you may not see the deployment Waiting states in the dashboard, as described in the following steps. -->
   > **注**：デプロイが即座に完了すると、次の手順で説明するように、ダッシュボードにデプロイの待機状態が表示されない場合があります。

<!-- 4. From the Replica Set view for the API, you will see it is now deploying and that there is one healthy instance and one pending instance. -->
4. APIのレプリカセットのビューから、APIがデプロイされ、正常なインスタンスが1つと保留中のインスタンスが1つあることがわかります。

   ![Replica Sets is selected under Workloads in the navigation menu on the left, and at right, Pods status: 1 pending, 1 running is highlighted. Below that, a red arrow points at the API deployment in the Pods box.](media/image117.png)

<!-- 5. From the navigation menu, select Deployments from the list. Note that the api service has a pending status indicated by the grey timer icon, and it shows a pod count 1 of 2 instances (shown as "1/2"). -->
5. ナビゲーションメニューで、リストから[Deployments]を選択します。 apiサービスには、灰色のタイマーアイコンで示される保留中のステータスがあり、2つのインスタンスのポッドカウント1が表示されます（「1/2」と表示）。

   ![In the Deployments box, the api service is highlighted with a grey timer icon at left and a pod count of 1/2 listed at right.](media/image118.png)

<!-- 6. From the Navigation menu, select Workloads. From this view, note that the health overview in the right panel of this view. You will see the following: -->
6. ナビゲーションメニューから、[ワークロード]を選択します。このビューから、このビューの右側のパネルにあるヘルスの概要に注意してください。以下が表示されます。

   <!-- - One deployment and one replica set are each healthy for the api service. -->
   - 1つのデプロイと1つのレプリカセットは、それぞれapiサービスに対して正常です。

   <!-- - One replica set is healthy for the web service. -->
   - 1つのレプリカセットがWebサービスに対して正常です。

   <!-- - Three pods are healthy. -->
   - 3つのPodは正しく動作しています。

<!-- 7. Navigate to the web application from the browser again. The application should still work without errors as you navigate to Speakers and Sessions pages -->
7. ブラウザーから再度Webアプリケーションに移動します。SpeakerとSessionのページに移動しても、アプリケーションはエラーなしで機能するはずです。

   <!-- - Navigate to the /stats page. You will see information about the environment including: -->
   - /statsページに移動します。次のような環境に関する情報が表示されます。

     <!-- - **webTaskId:** The task identifier for the web service instance. -->
     - **webTaskId：** Webサービスインスタンスのタスク識別子。

     <!-- - **taskId:** The task identifier for the API service instance. -->
     - **taskId：** APIサービスインスタンスのタスク識別子。

     <!-- - **hostName:** The hostname identifier for the API service instance. -->
     - **hostName：** APIサービスインスタンスのホスト名識別子。

     <!-- - **pid:** The process id for the API service instance. -->
     - **pid：** APIサービスインスタンスのプロセスID。

     <!-- - **mem:** Some memory indicators returned from the API service instance. -->
     - **mem：** APIサービスインスタンスから返されるいくつかのメモリインジケータ。

     <!-- - **counters:** Counters for the service itself, as returned by the API service instance. -->
     - **counters：** APIサービスインスタンスによって返される、サービス自体のカウンター。

     <!-- - **uptime:** The up time for the API service. -->
     - **uptime：** APIサービスの稼働時間。

   <!-- - Refresh the page in the browser, and you can see the hostName change between the two API service instances. The letters after "api-{number}-" in the hostname will change. -->
   - ブラウザでページを更新すると、2つのAPIサービスインスタンス間のhostNameの変更を確認できます。ホスト名の「api- {number}-」の後の文字が変わるのを確認してください。

<!-- ### Task 2: Increase service instances beyond available resources -->
### Task2：利用可能なリソースを超えるサービスインスタンスを増やす

<!-- In this task, you will try to increase the number of instances for the API service container beyond available resources in the cluster. You will observe how Kubernetes handles this condition and correct the problem. -->
このタスクでは、APIサービスコンテナーのインスタンス数を、クラスターで使用可能なリソースを超えて増やします。 Kubernetesがこの状態を処理する方法を観察し、問題を修正します。

<!-- 1. From the navigation menu, select Deployments. From this view, select the API deployment. -->
1. ナビゲーションメニューから、[Deployments]を選択します。このビューから、APIデプロイメントを選択します。

<!-- 2. Configure the deployment to use a fixed host port for initial testing. Select Edit. -->
2. テストで固定ホストポートを使用するように配置を構成します。編集を選択します。

   ![In the Workloads > Deployments > api bar, the Edit icon is highlighted.](media/image81.png)

<!-- 3. In the Edit a Deployment dialog, you will see a list of settings shown in JSON format. Use the copy button to copy the text to your clipboard. -->
3. [Edit a Deployment]ダイアログに、JSON形式で表示された設定のリストが表示されます。コピーボタンを使用して、テキストをクリップボードにコピーします。

   ![Screenshot of the Edit a Deployment dialog box that displays JSON data.](media/image82.png)

<!-- 4. Paste the contents into the text editor of your choice (notepad is shown here, MacOS users can use TextEdit). -->
4. 選択したテキストエディターに内容を貼り付けます（ここにメモ帳が表示され、MacOSユーザーはTextEditを使用できます）。

   ![Screenshot of the Edit a Deployment contents pasted into Notepad text editor.](media/image83.png)

<!-- 5. Scroll down about halfway to find the node "\$.spec.template.spec.containers[0]", as shown in the screenshot below. -->
5. 下のスクリーンショットに示すように、半分ほど下にスクロールして、[\$.spec.template.spec.containers [0]]を見つけます。

   ![Screenshot of the deployment JSON code, with the $.spec.template.spec.containers[0] section highlighted.](media/image84.png)

<!-- 6. The containers spec has a single entry for the API container at the moment. You will see that the name of the container is "api" - this is how you know you are looking at the correct container spec. -->
6. コンテナのspecには、現時点ではAPIコンテナのエントリが1つあります。コンテナーの名前が「api」であることがわかります。これは、正しいコンテナー仕様を確認していることを示す方法です。

   <!-- - Add the following JSON snippet below the "name" property in the container spec: -->
   - 次のJSONスニペットをコンテナ仕様の「name」プロパティの下に追加します。

   ```json
   "ports": [
       {
       "containerPort": 3001,
       "hostPort": 3001
       }
   ],
   ```

   <!-- - Your container spec should now look like this: -->
   - コンテナのspecは次のようになります。

   ![Screenshot of the deployment JSON code, with the $.spec.template.spec.containers[0] section highlighted, showing the updated values for containerPort and hostPort, both set to port 3001.](media/image85.png)

<!-- 7. Copy the updated JSON document from notepad into the clipboard. Return to the Kubernetes dashboard, which should still be viewing the "api" deployment. -->
7. 更新されたJSONドキュメントをメモ帳からクリップボードにコピーします。 Kubernetesダッシュボードに戻ります。ダッシュボードには、まだ「api」デプロイメントが表示されているはずです。

   <!-- - Select Edit. -->
   - [編集]を選択します。

   ![In the Workloads > Deployments > api bar, the Edit icon is highlighted.](media/image87.png)

   <!-- - Paste the updated JSON document. -->
   - 更新されたJSONドキュメントを貼り付けます。

   <!-- - Select Update. -->
   - [更新]を選択します。

   ![UPDATE is highlighted in the Edit a Deployment dialog box.](media/image88.png)

<!-- 8. From the API deployment view, select **Scale**. -->
8. APIデプロイビューから、[**Scale**]を選択します。

   ![In the Workloads > Deployments > api bar, the Scale icon is highlighted.](media/image89.png)

<!-- 9. Change the number of pods to 4 and select **OK**. -->
9. ポッドの数を4に変更し、[**OK**]を選択します。

   ![In the Scale a Deployment dialog box, 4 is entered in the Desired number of pods box.](media/image119.png)

<!-- 10. From the navigation menu, select Services view under Discovery and Load Balancing. Select the api service from the Services list. From the api service view, you will see it has two healthy instances and two unhealthy (or possibly pending depending on timing) instances. -->
10. ナビゲーションメニューの[Discovery and Load Balancing]で[Service]ビューを選択します。 「Service」リストからAPIサービスを選択します。 APIサービスビューから、2つの正常なインスタンスと2つの異常な（またはタイミングによっては保留中の）インスタンスがあることがわかります。

    ![In the api service view, various information is displayed in the Details box and in the Pods box.](media/image120.png)

<!-- 11. After a few minutes, select Workloads from the navigation menu. From this view, you should see an alert reported for the api deployment. -->
11. 数分後、ナビゲーションメニューから[Workloads]を選択します。このビューから、APIデプロイメントについて報告されたアラートが表示されます。

    ![Workloads is selected in the navigation menu. At right, an exclamation point (!) appears next to the api deployment listing in the Deployments box.](media/image121.png)

    <!-- > **Note**: This message indicates that there were not enough available resources to match the requirements for a new pod instance. In this case, this is because the instance requires port 3001, and since there are only 2 nodes available in the cluster, only two api instances can be scheduled. The third and fourth pod instances will wait for a new node to be available that can run another instance using that port. -->
    > **注**：このメッセージは、新しいポッドインスタンスの要件に一致する十分なリソースがないことを示しています。この場合、これはインスタンスにポート3001が必要であり、クラスターで使用できるノードが2つしかないため、スケジュールできるAPIインスタンスは2つだけであるためです。 3番目と4番目のポッドインスタンスは、そのポートを使用して別のインスタンスを実行できる新しいノードが利用可能になるまで待機します。

<!-- 12. Reduce the number of requested pods to 2 using the Scale button. -->
12. スケールボタンを使用して、要求されたポッドの数を2に減らします。

<!-- 13. Almost immediately, the warning message from the Workloads dashboard should disappear, and the API deployment will show 2/2 pods are running. -->
13. すぐに、ワークロードダッシュボードからの警告メッセージが消え、APIデプロイに2/2ポッドが実行中であることが示されます。

    ![Workloads is selected in the navigation menu. A green check mark now appears next to the api deployment listing in the Deployments box at right.](media/image122.png)

<!-- ### Task 3: Restart containers and test HA -->
### Task3：コンテナーを再起動してHAをテストする

<!-- In this task, you will restart containers and validate that the restart does not impact the running service. -->
このタスクでは、コンテナーを再起動し、再起動が実行中のサービスに影響を与えないことを検証します。

<!-- 1. From the navigation menu on the left, select Services view under Discovery and Load Balancing. From the Services list, select the external endpoint hyperlink for the web service, and visit the stats page by adding /stats to the URL. Keep this open and handy to be refreshed as you complete the steps that follow. -->
1. 左側のナビゲーションメニューで、[Discovery and Load Balancing]の[Service]ビューを選択します。 [Service]リストからWebサービスの外部エンドポイントハイパーリンクを選択し、/statsをURLに追加して統計ページにアクセスします。次の手順を完了するときに、これを開いて手元に置いて更新してください。

   ![In the Services box, a red arrow points at the hyperlinked external endpoint for the web service. ](media/image112.png)

   ![The Stats page is visible in this screenshot of the Contoso Neuro 2017 web application.](media/image123.png)

<!-- 2. From the navigation menu, select Workloads>Deployments. From Deployments list, select the API deployment. -->
2. ナビゲーションメニューから、[Workloads]> [Deployment]を選択します。 [Deployment]リストから、APIデプロイを選択します。

   ![In the left menu the Deployments item is selected. The API deployment is highlighted in the Deployments list box.](media/image124.png)

<!-- 3. From the API deployment view, select **Scale** and from the dialog presented, and enter 4 for the desired number of pods. Select **OK**. -->
3. APIデプロイビューで、[**スケール**]を選択し、表示されたダイアログから、必要なポッド数として4を入力します。 [**OK**]を選択します。

<!-- 4. From the navigation menu, select Workloads>Replica Sets. Select the api replica set, and from the Replica Set view, you will see that two pods cannot deploy. -->
4. ナビゲーションメニューから、[Workload]> [ReplicaSet]を選択します。 APIレプリカセットを選択すると、レプリカセットビューから、2つのポッドをデプロイできないことがわかります。

   ![Replica Sets is selected under Workloads in the navigation menu on the left. On the right are the Details and Pods boxes. In the Pods box, two pods have exclamation point (!) alerts and messages indicating that they cannot deploy.](media/image125.png)

<!-- 5. Return to the browser tab with the web application stats page loaded. Refresh the page over and over. You will not see any errors, but you will see the api host name change between the two api pod instances periodically. The task id and pid might also change between the two api pod instances. -->
5. Webアプリケーションの統計ページが読み込まれた状態でブラウザーのタブに戻ります。ページを何度も更新します。エラーは表示されませんが、2つのAPI Pod間で定期的にAPIホスト名が変更されます。タスクIDとPIDは、2つのAPI Pod間でも変わる可能性があります。

   ![On the Stats page in the Contoso Neuro 2017 web application, two different api host name values are highlighted.](media/image126.png)

<!-- 6. After refreshing enough times to see that the hostName value is changing, and the service remains healthy, return to the Replica ?Sets view for the API. From the navigation menu, select Replica Sets under Workloads and select the API replica set. -->
6. hostNameの値が変化し、サービスが正常なままであることを確認するのに十分な回数更新した後、APIの[ReplicaSet]ビューに戻ります。ナビゲーションメニューの[Workload]で[ReplicaSet]を選択し、APIレプリカセットを選択します。

<!-- 7. From this view, take note that the hostName value shown in the web application stats page matches the pod names for the pods that are running. -->
7. このビューから、ウェブアプリケーションの統計ページに表示されるhostNameの値が、実行中のポッドのポッド名と一致することに注意してください。

   ![Two different pod names are highlighted in the Pods box, which match the values from the previous Stats page.](media/image127.png)

<!-- 8. Note the remaining pods are still pending, since there are not enough port resources available to launch another instance. Make some room by deleting a running instance. Select the context menu and choose Delete for one of the healthy pods. -->
8. 別のインスタンスを起動するために利用できる十分なポートリソースがないため、残りのポッドはまだ保留中です。実行中のインスタンスを削除して、スペースを確保します。コンテキストメニューを選択し、正常なポッドのいずれかで[Delete]を選択します。

   ![The context menu for a pod in the pod list is expanded with the Delete item selected.](media/image128.png)

<!-- 9. Once the running instance is gone, Kubernetes will be able to launch one of the pending instances. However, because you set the desired size of the deploy to 4, Kubernetes will add a new pending instance. Removing a running instance allowed a pending instance to start, but in the end, the number of pending and running instances is unchanged. -->
9. 実行中のインスタンスがなくなると、Kubernetesは保留中のインスタンスの1つを起動できるようになります。ただし、デプロイの目的のサイズを4に設定したため、Kubernetesは保留中の新しいインスタンスを追加します。実行中のインスタンスを削除すると、保留中のインスタンスを開始できましたが、最終的には、保留中および実行中のインスタンスの数は変わりません。

   ![The first row of the Pods box is highlighted, and the pod has a green check mark and is running.](media/image129.png)

<!-- 10. From the navigation menu, select Deployments under Workloads. From the view's Deployments list, select the API deployment. -->
10. ナビゲーションメニューの[Workload]で[Deployment]を選択します。ビューの[Deployment]リストから、APIデプロイメントを選択します。

<!-- 11. From the API Deployment view, select Scale and enter 1 as the desired number of pods. Select OK. -->
11. [Deployment]ビューから[Scale]を選択し、必要なPod数として1を入力します。 OKを選択します。

    ![In the Scale a Deployment dialog box, 1 is entered in the Desired number of pods box.](media/image130.png)

<!-- 12. Return to the web site's stats page in the browser and refresh while this is scaling down. You will notice that only one API host name shows up, even though you may still see several running pods in the API replica set view. Even though several pods are running, Kubernetes will no longer send traffic to the pods it has selected to scale down. In a few moments, only one pod will show in the API replica set view. -->
12. ブラウザーでWebサイトの統計ページに戻り、スケールダウンしている間に更新します。 APIレプリカセットビューにいくつかの実行中のPodが表示されている場合でも、表示されるAPIホスト名は1つだけです。複数のPodが実行されている場合でも、Kubernetesはスケールダウンするように選択したPodにトラフィックを送信しなくなります。しばらくすると、APIレプリカセットビューにPodが1つだけ表示されます。

    ![Replica Sets is selected under Workloads in the navigation menu on the left. On the right are the Details and Pods boxes. Only one API host name, which has a green check mark and is listed as running, appears in the Pods box.](media/image131.png)

<!-- 13. From the navigation menu, select Workloads. From this view, note that there is only one API pod now. -->
13. ナビゲーションメニューから、[Workload]を選択します。このビューから、現在、APIポッドは1つしかないことに注意してください。

    ![Workloads is selected in the navigation menu on the left. On the right are the Deployment, Pods, and Replica Sets boxes.](media/image132.png)

<!-- ## Exercise 4: Working with services and routing application traffic -->
## 演習4：サービスの操作とアプリケーショントラフィックのルーティング

<!-- **Duration**: 45 minutes -->
**作業時間**：45分

<!-- In the previous exercise, we introduced a restriction to the scale properties of the service. In this exercise, you will configure the api deployments to create pods that use dynamic port mappings to eliminate the port resource constraint during scale activities. -->
前の演習では、サービスのスケールプロパティに制限を導入しました。この演習では、APIデプロイメントを構成して、動的ポートマッピングを使用するPodを作成し、スケールアクティビティ中のポートリソースの制約を排除します。

<!-- Kubernetes services can discover the ports assigned to each pod, allowing you to run multiple instances of the pod on the same agent node --- something that is not possible when you configure a specific static port (such as 3001 for the API service). -->
Kubernetesサービスは各Podに割り当てられたポートを検出できるため、同じエージェントノードでPodの複数のインスタンスを実行できます---特定の静的ポート（APIサービスの3001など）を構成する場合は不可能です。


<!-- ### Task 1: Scale a service without port constraints -->
### Task1：ポートの制約なしでサービスをスケーリングする

<!-- In this task, we will reconfigure the API deployment so that it will produce pods that choose a dynamic hostPort for improved scalability. -->
このタスクでは、拡張性を向上させるために動的hostPortを選択するPodを生成するように、APIデプロイメントを再構成します。

<!-- 1. From the navigation menu select Deployments under Workloads. From the view's Deployments list, select the API deployment. -->
1. ナビゲーションメニューから、[Workload]の[Deployment]を選択します。ビューの[Deployment]リストから、APIデプロイメントを選択します。

<!-- 2. Select Edit. -->
2. [Edit]を選択します。

<!-- 3. From the Edit a Deployment dialog, do the following: -->
3. [Edit a Deployment]ダイアログで、次の操作を行います。

   <!-- - Scroll to the first spec node that describes replicas as shown in the screenshot. Set the value for replicas to 4. -->
   - スクリーンショットに示すように、レプリカを説明する最初のスペックノードまでスクロールします。レプリカの値を4に設定します。

   <!-- - Within the replicas spec, beneath the template node, find the "api" containers spec. Remove the hostPort entry for the API container's port mapping.  The screenshot below shows the desired configuration after editing. -->
   - レプリカの仕様内で、テンプレートノードの下にある「api」コンテナの仕様を見つけます。 APIコンテナーのポートマッピングのhostPortエントリを削除します。以下のスクリーンショットは、編集後の望ましい構成を示しています。

     ![This is a screenshot of the Edit a Deployment dialog box with various displayed information about spec, selector, and template. Under the spec node, replicas: 4 is highlighted. Further down, ports are highlighted.](media/image137.png)

<!-- 4. Select **Update**. New pods will now choose a dynamic port. -->
4. [**Update**]を選択します。新しいPodは動的ポートを選択します。

<!-- 5. The API service can now scale to 4 pods since it is no longer constrained to an instance per node -- a previous limitation while using port 3001. -->
5. APIサービスは、ノードあたりのインスタンスに制限されなくなったため、4つのPodにスケーリングできるようになりました。これは、ポート3001の使用中の以前の制限です。

   ![Replica Sets is selected under Workloads in the navigation menu on the left. On the right, four pods are listed in the Pods box, and all have green check marks and are listed as Running.](media/image138.png)

<!-- 6. Return to the browser and refresh the stats page. You should see all 4 pods serve responses as you refresh. -->
6. ブラウザに戻り、統計ページを更新します。更新すると、4つのPodすべてが応答を提供するはずです。

<!-- ### Task 2: Update an external service to support dynamic discovery with a load balancer -->
### Task2：ロードバランサーによる動的検出をサポートするように外部サービスを更新する

<!-- In this task, you will update the web service so that it supports dynamic discovery through the Azure load balancer. -->
このタスクでは、Azureロードバランサーによる動的検出をサポートするようにWebサービスを更新します。

<!-- 1. From the navigation menu, select Deployments under Workloads. From the view's Deployments list, select the web deployment. -->
1. ナビゲーションメニューから、[Workload]の[Deployment]を選択します。ビューの[Deploy]リストから、Webのデプロイメントを選択します。

<!-- 2. Select **Edit**. -->
2. [**Edit**]を選択します。

<!-- 3. From the Edit a Deployment dialog, scroll to the web containers spec as shown in the screenshot. Remove the hostPort entry for the web container's port mapping. -->
3. [Edit a Deployment]ダイアログから、スクリーンショットに示すようにWebコンテナーのspecまでスクロールします。 WebコンテナのポートマッピングのhostPortエントリを削除します。

   ![This is a screenshot of the Edit a Deployment dialog box with various displayed information about spec, containers, ports, and env. The ports node, containerPort: 3001 and protocol: TCP are highlighted.](media/image140.png)

4. Select **Update**.
4. [**Update**]を選択します。

<!-- 5. From the web Deployments view, select **Scale**. From the dialog presented enter 4 as the desired number of pods and select **OK**. -->
5. Web Deploymentsビューから、**Scale** を選択します。表示されたダイアログで、Podの数4を入力し、[**OK**]を選択します。

<!-- 6. Check the status of the scale out by refreshing the web deployment's view. From the navigation menu, select Deployments from under Workloads. Select the web deployment. From this view, you should see an error like that shown in the following screenshot. -->
6. Webデプロイメントのビューを更新して、スケールアウトのステータスを確認します。ナビゲーションメニューで、[Workload]の下の[Deployment]を選択します。 Webデプロイメントを選択します。このビューから、次のスクリーンショットに示すようなエラーが表示されます。

   ![Deployments is selected under Workloads in the navigation menu on the left. On the right are the Details and New Replica Set boxes. The web deployment is highlighted in the New Replica Set box, indicating an error.](media/image141.png)

<!-- Like the API deployment, the web deployment used a fixed _hostPort_, and your ability to scale was limited by the number of available agent nodes. However, after resolving this issue for the web service by removing the _hostPort_ setting, the web deployment is still unable to scale past two pods due to CPU constraints. The deployment is requesting more CPU than the web application needs, so you will fix this constraint in the next task. -->
APIデプロイメントと同様に、Webデプロイメントは固定の _hostPort_ を使用し、スケーリングする機能は、使用可能なエージェントノードの数によって制限されていました。ただし、 _hostPort_ 設定を削除してWebサービスのこの問題を解決した後も、CPUのLimitにより、Webデプロイメントは2つのPodを超えてスケ​​ーリングできません。デプロイメントはWebアプリケーションが必要とするよりも多くのCPUを要求しているので、次のタスクでこのLimitを修正します。

<!-- ### Task 3: Adjust CPU constraints to improve scale -->
### Task3：スケールを改善するためにCPU制約を調整する

<!-- In this task, you will modify the CPU requirements for the web service so that it can scale out to more instances. -->
このタスクでは、より多くのインスタンスにスケールアウトできるように、WebサービスのCPU Requestを変更します。

<!-- 1. From the navigation menu, select Deployments under Workloads. From the view's Deployments list, select the web deployment. -->
1. ナビゲーションメニューから、[Workload]の[Deployment]を選択します。ビューの[Deploy]リストから、Webのデプロイを選択します。

<!-- 2. Select **Edit**. -->
2. [**Edit**]を選択します。

<!-- 3. From the Edit a Deployment dialog, find the _cpu_ resource requirements for the web container. Change this value to "125m". -->
3. [Edit a Deployment]ダイアログから、Webコンテナーの[ _cpu_ resource requirements]を見つけます。この値を「125m」に変更します。

   ![This is a screenshot of the Edit a Deployment dialog box with various displayed information about ports, env, and resources. The resources node, with cpu: 125m selected, is highlighted.](media/image142.png)

<!-- 4. Select **Update** to save the changes and update the deployment. -->
4. [**Update**]を選択して変更を保存し、デプロイメントを更新します。

<!-- 5. From the navigation menu, select Replica Sets under Workloads. From the view's Replica Sets list select the web replica set. -->
5. ナビゲーションメニューから、[Workload]の下の[ReplicaSet]を選択します。ビューの[ReplicaSet]リストから、Webレプリカセットを選択します。

<!-- 6. When the deployment update completes, four web pods should be shown in running state. -->
6. デプロイメントの更新が完了すると、4つのPodが実行状態で表示されます。

   ![Four web pods are listed in the Pods box, and all have green check marks and are listed as Running.](media/image143.png)

<!-- 7. Return to the browser tab with the web application loaded. Refresh the stats page at /stats to watch the display update to reflect the different api pods by observing the host name refresh. -->
7. Webアプリケーションが読み込まれた状態でブラウザタブに戻ります。 /statsの統計ページを更新して、ホスト名の更新を監視することにより、異なるAPI Podを反映するように表示が更新されるのを確認します。

<!-- ### Task 4: Perform a rolling update -->
### Task4：ローリング更新を実行する

<!-- In this task, you will edit the web application source code to add Application Insights and update the Docker image used by the deployment. Then you will perform a rolling update to demonstrate how to deploy a code change. -->
このタスクでは、Webアプリケーションのソースコードを編集してApplication Insightsを追加し、デプロイメントで使用されるDockerイメージを更新します。次に、ローリングアップデートを実行して、コード変更をデプロイする方法を示します。

<!-- 1. Execute this command in Azure Cloud Shell to retrieve the instrumentation key for the `content-web` Application Insights resource: -->
1. Azure Cloud Shellで次のコマンドを実行して、 `content-web` Application Insightsリソースのinstrumentation keyを取得します。

   ```bash
   az resource show -g fabmedical-[SUFFIX] -n content-web --resource-type "Microsoft.Insights/components" --query properties.InstrumentationKey -o tsv
   ```

   <!-- Copy this value. You will use it later. -->
   この値をコピーします。後で使用します。

<!-- 2. Update your starter files by pulling the latest changes from Azure DevOps. -->
2. Azure DevOpsから最新の変更をプルして、サンプルファイルを更新します。

   ```bash
   cd ~/MCW-Cloud-native-applications/Hands-on\ lab/lab-files/developer/content-web
   git pull
   ```

<!-- 3. Install support for Application Insights. -->
3. Application Insightsのサポートをインストールします。

   ```bash
   npm install applicationinsights --save
   ```

<!-- 4. Open the app.js file: -->
4. app.jsファイルを開きます。

   ```bash
   code app.js
   ```

<!-- 5. Add the following lines immediately after `express` is instantiated: -->
5. `express`がインスタンス化された直後に次の行を追加します：

   ```javascript
   const appInsights = require("applicationinsights");
   appInsights.setup("[YOUR APPINSIGHTS KEY]");
   appInsights.start();
   ```

   ![A screenshot of the code editor showing updates in context of the app.js file](media/hol-2019-10-02_12-33-29.png)

<!-- 6. Save changes and close the editor. -->
6. 変更を保存してエディターを閉じます。

<!-- 7. Push these changes to your repository so that Azure DevOps CI will build and deploy a new image. -->
7. これらの変更をリポジトリにプッシュして、Azure DevOps CIが新しいイメージをビルドしてデプロイできるようにします。

   ```bash
   git add .
   git commit -m "Added Application Insights"
   git push
   ```

<!-- 8. Visit your Azure DevOps pipeline for the `content-web` application and see the new image being deployed into your Kubernetes cluster. -->
8. `content-web`アプリケーションのAzure DevOpsパイプラインにアクセスし、Kubernetesクラスターにデプロイされている新しいイメージを確認します。

<!-- 9. While this update runs, return the Kubernetes management dashboard in the browser. -->
9. 更新の実行中に、ブラウザでKubernetes管理ダッシュボードに戻ります。

<!-- 10. From the navigation menu, select Replica Sets under Workloads. From this view, you will see a new replica set for the web, which may still be in the process of deploying (as shown below) or already fully deployed. -->
10. ナビゲーションメニューから、[Workload]の[ReplicaSet]を選択します。このビューから、Webの新しいレプリカセットが表示されます。これは、デプロイ中（下図を参照）または完全に展開されている可能性があります。

    ![At the top of the list, a new web replica set is listed as a pending deployment in the Replica Set box.](media/image144.png)

<!-- 11. While the deployment is in progress, you can navigate to the web application and visit the stats page at /stats. Refresh the page as the rolling update executes. Observe that the service is running normally, and tasks continue to be load balanced. -->
11. デプロイメントの進行中に、Webアプリケーションに移動して、/statsの統計ページにアクセスできます。ローリングアップデートの実行時にページを更新します。サービスが正常に実行されており、タスクの負荷が分散されていることを確認します。

    ![On the Stats page, the webTaskId is highlighted.](media/image145.png)

<!-- ### Task 5: Configure Kubernetes Ingress -->
### Task5：Kubernetes Ingressを構成する

<!-- In this task you will setup a Kubernetes Ingress to take advantage of path-based routing and TLS termination. -->
このタスクでは、Kubernetes Ingressをセットアップして、パスベースのルーティングとTLSターミネーションを利用します。

<!-- 1. Update your helm package list. -->
1. helmパッケージリストを更新します。

   ```bash
   helm repo update
   ```

<!-- 2. Install the ingress controller resource to handle ingress requests as they come in. The ingress controller will receive a public IP of its own on the Azure Load Balancer and be able to handle requests for multiple services over port 80 and 443. -->
2. イングレスコントローラーリソースをインストールして、入ってくるリクエストを処理します。イングレスコントローラーは、Azureロードバランサーで独自のパブリックIPを受信し、ポート80および443で複数のサービスのリクエストを処理できます。

   ```bash
   helm install stable/nginx-ingress --namespace kube-system --set controller.replicaCount=2
   ```

<!-- 3. Set a DNS prefix on the IP address allocated to the ingress controller. Visit the `kube-system` namespace in your Kubernetes dashboard to find the IP. Append the following path after the `#!/` marker in the URL: -->
3. 入力コントローラに割り当てられたIPアドレスにDNSプレフィックスを設定します。 Kubernetesダッシュボードの「kube-system」名前空間にアクセスして、IPを見つけます。 URLの `＃!/`の後に次のパスを追加します。

   ```text
   service?namespace=kube-system
   ```

   ![A screenshot of the Kubernetes management dashboard showing the ingress controller settings.](media/Ex4-Task5.5.png)

**注**：またはAzure Cloud Shellで次のコマンドを使用してIPを見つけることができます。

   ```
   kubectl get svc --namespace kube-system
   ```

![A screenshot of Azure Cloud Shell showing the command output.](media/Ex4-Task5.5a.png)

<!-- 4. Create a script to update the public DNS name for the IP. -->
4. IPのパブリックDNS名を更新するスクリプトを作成します。

   ```bash
   code update-ip.sh
   ```

   <!-- Paste the following as the contents and update the IP and SUFFIX values: -->
   以下をコンテンツとして貼り付け、IPとSUFFIXの値を更新します。

   ```bash
   #!/bin/bash

   # Public IP address
   IP="[INGRESS PUBLIC IP]"

   # Name to associate with public IP address
   DNSNAME="fabmedical-[SUFFIX]-ingress"

   # Get the resource-id of the public ip
   PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

   # Update public ip address with dns name
   az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME
   ```

   ![A screenshot of cloud shell editor showing the updated file.](media/Ex4-Task5.6.png)

<!-- 5. Save changes and close the editor. -->
5. 変更を保存してエディターを閉じます。

<!-- 6. Run the update script. -->
6. 更新スクリプトを実行します。

   ```bash
   bash ./update-ip.sh
   ```

<!-- 7. Verify the IP update by visiting the URL in your browser. -->
7. WebブラウザでURLにアクセスして、IPアップデートを確認します。

   <!-- > **Note**: It is normal to receive a 404 message at this time. -->
   > **注**：この時点で404メッセージを受信するのは正常です。

   ```text
   http://fabmedical-[SUFFIX]-ingress.[AZURE-REGION].cloudapp.azure.com/
   ```

   ![A screenshot of the browser URL.](media/Ex4-Task5.9.png)

<!-- 8. Use helm to install `cert-manager`, a tool that can provision SSL certificates automatically from letsencrypt.org. -->
8. helmを使用して、letsencrypt.orgからSSL証明書を自動的にプロビジョニングできるツールである「cert-manager」をインストールします。

   ```bash
   kubectl create namespace cert-manager

   kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true

   kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.8.1/cert-manager.yaml
   ```

<!-- 9. Cert manager will need a custom ClusterIssuer resource to handle requesting SSL certificates. -->
9. 証明書マネージャには、SSL証明書の要求を処理するためのカスタムClusterIssuerリソースが必要です。

   ```bash
   code clusterissuer.yml
   ```

   <!-- The following resource configuration should work as is: -->
   次のリソース構成はそのまま機能します。

   ```yaml
   apiVersion: certmanager.k8s.io/v1alpha1
   kind: ClusterIssuer
   metadata:
     name: letsencrypt-prod
   spec:
     acme:
       # The ACME server URL
       server: https://acme-v02.api.letsencrypt.org/directory
       # Email address used for ACME registration
       email: user@fabmedical.com
       # Name of a secret used to store the ACME account private key
       privateKeySecretRef:
         name: letsencrypt-prod
       # Enable HTTP01 validations
       http01: {}
   ```

<!-- 10. Save changes and close the editor. -->
10. 変更を保存してエディターを閉じます。

<!-- 11. Create the issuer using kubectl. -->
11. kubectlを使用して発行者を作成します。

    ```bash
    kubectl create --save-config=true -f clusterissuer.yml
    ```

<!-- 12. Now you can create a certificate object. -->
12. これで、証明書オブジェクトを作成できます。

    <!--  **Note**: -->
    > **注**：
    >
    > Cert-managerは、ingress-shimを使用してすでに証明書オブジェクトを作成している場合があります。
    > 証明書が正常に作成されたことを確認するには、 `kubectl describe certificate tls-secret`コマンドを使用します。
    > 証明書がすでに利用可能な場合は、ステップ16にスキップします。

    ```bash
    code certificate.yml
    ```

    <!-- Use the following as the contents and update the [SUFFIX] and [AZURE-REGION] to match your ingress DNS name: -->
    以下を内容で[SUFFIX]と[AZURE-REGION]を更新して、入力DNS名と一致させます。

    ```yaml
    apiVersion: certmanager.k8s.io/v1alpha1
    kind: Certificate
    metadata:
      name: tls-secret
    spec:
      secretName: tls-secret
      dnsNames:
        - fabmedical-[SUFFIX]-ingress.[AZURE-REGION].cloudapp.azure.com
      acme:
        config:
          - http01:
              ingressClass: nginx
            domains:
              - fabmedical-[SUFFIX]-ingress.[AZURE-REGION].cloudapp.azure.com
      issuerRef:
        name: letsencrypt-prod
        kind: ClusterIssuer
    ```

<!-- 13. Save changes and close the editor. -->
13. 変更を保存してエディターを閉じます。

<!-- 14. Create the certificate using kubectl. -->
14. kubectlを使用して証明書を作成します。

    ```bash
    kubectl create --save-config=true -f certificate.yml
    ```

    > **Note**: To check the status of the certificate issuance, use the `kubectl describe certificate tls-secret` command and look for an _Events_ output similar to the following:
    >
    > ```text
    > Type    Reason         Age   From          Message
    > ----    ------         ----  ----          -------
    > Normal  Generated           38s   cert-manager  Generated new private key
    > Normal  GenerateSelfSigned  38s   cert-manager  Generated temporary self signed certificate
    > Normal  OrderCreated        38s   cert-manager  Created Order resource "tls-secret-3254248695"
    > Normal  OrderComplete       12s   cert-manager  Order "tls-secret-3254248695" completed successfully
    > Normal  CertIssued          12s   cert-manager  Certificate issued successfully
    > ```

    <!-- > It can take between 5 and 30 minutes before the tls-secret becomes available. This is due to the delay involved with provisioning a TLS cert from letsencrypt. -->
   > tls-secretが使用可能になるまでに5〜30分かかる場合があります。これは、letsencryptからのTLS証明書のプロビジョニングに伴う遅延が原因です。

<!-- 15. Now you can create an ingress resource for the content applications. -->
15. これで、コンテンツアプリケーションのIngressリソースを作成できます。

    ```bash
    code content.ingress.yml
    ```

    <!-- Use the following as the contents and update the [SUFFIX] and [AZURE-REGION] to match your ingress DNS name: -->
    以下の内容で[SUFFIX]と[AZURE-REGION]を更新して、入力DNS名と一致させます。

    ```yaml
    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: content-ingress
      annotations:
        kubernetes.io/ingress.class: nginx
        certmanager.k8s.io/cluster-issuer: letsencrypt-prod
        nginx.ingress.kubernetes.io/rewrite-target: /$1
    spec:
      tls:
        - hosts:
            - fabmedical-[SUFFIX]-ingress.[AZURE-REGION].cloudapp.azure.com
          secretName: tls-secret
      rules:
        - host: fabmedical-[SUFFIX]-ingress.[AZURE-REGION].cloudapp.azure.com
          http:
            paths:
              - path: /(.*)
                backend:
                  serviceName: web
                  servicePort: 80
              - path: /content-api/(.*)
                backend:
                  serviceName: api
                  servicePort: 3001
    ```

<!-- 16. Save changes and close the editor. -->
16. 変更を保存してエディターを閉じます。

<!-- 17. Create the ingress using kubectl. -->
17. kubectlを使用してIngressを作成します。

    ```bash
    kubectl create --save-config=true -f content.ingress.yml
    ```

<!-- 18. Refresh the ingress endpoint in your browser. You should be able to visit the speakers and sessions pages and see all the content. -->
18. ブラウザーの入力エンドポイントを更新します。SpeakerとSessionのページにアクセスして、すべてのコンテンツを表示できるはずです。

<!-- 19. Visit the api directly, by navigating to `/content-api/sessions` at the ingress endpoint. -->
19. 入力エンドポイントで「/content-api/sessions」に移動して、APIに直接アクセスします。

    ![A screenshot showing the output of the sessions content in the browser.](media/Ex4-Task5.19.png)

<!-- 20. Test TLS termination by visiting both services again using `https`. -->
20. `https`を使用して両方のサービスに再度アクセスして、TLS終了をテストします。

    <!-- > It can take between 5 and 30 minutes before the SSL site becomes available. This is due to the delay involved with provisioning a TLS cert from letsencrypt. -->
    > SSLサイトが利用可能になるまでに5〜30分かかる場合があります。これは、letsencryptからのTLS証明書のプロビジョニングに伴う遅延が原因です。

<!-- ## After the hands-on lab -->
## ハンズオンラボの環境削除

<!-- **Duration**: 10 mins -->
**作業時間**：10分

<!-- In this exercise, you will de-provision any Azure resources created in support of this lab. -->
この演習では、このラボをサポートするために作成されたすべてのAzureリソースをプロビジョニング解除します。

<!-- 1. Delete the Resource Groups in which you placed all your Azure resources. -->
1. すべてのAzureリソースを配置したリソースグループを削除します。

   <!-- - From the Portal, navigate to the blade of your Resource Group and then select Delete in the command bar at the top. -->
   - ポータルからリソースグループのブレードに移動し、上部のコマンドバーで[Delete]を選択します。

   <!-- - Confirm the deletion by re-typing the resource group name and selecting Delete. -->
   - リソースグループ名を再入力して[Delete]を選択し、削除を確認します。

<!-- 2. Delete the Service Principal created on Task 3: Create a Service Principal before the hands-on lab. -->
2. ハンズオンラボの事前準備、「サービスプリンシパルを作成する」で作成したサービスプリンシパルを削除します。

   ```bash
   az ad sp delete --id "Fabmedical-sp"
   ```

<!-- You should follow all steps provided _after_ attending the Hands-on lab. -->
ハンズオンラボに参加した後のすべての手順を実行する必要があります。

[logo]: https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/master/Media/ms-cloud-workshop.png
[portal]: https://portal.azure.com

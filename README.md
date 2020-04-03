<!--
# Cloud-native applications

Fabrikam Medical Conferences provides conference web site services, tailored to the medical community. Their business has grown and the management of many instances of the code base and change cycle per tenant has gotten out of control.

The goal of this workshop is to help them build a proof of concept (POC) that will migrate their code to a more manageable process that involves containerization of tenant code, a better DevOps workflow, and a simple lift-and-shift story for their database backend.

February 2020

## Target Audience

- Application developer
- Infrastructure architect

## Abstracts

### Workshop

In this workshop, you will build a proof of concept (POC) that will transform an existing on-premises application to a container-based application. This POC will deliver a multi-tenant web app hosting solution leveraging Azure Kubernetes Service (AKS), Docker containers on Linux nodes, and a migration from MongoDB to CosmosDB.

At the end of this workshop, you will be better able to improve the reliability of and increase the release cadence of your container-based applications through time-tested DevOps practices.

### Whiteboard Design Session

In this whiteboard design session, you will learn about the choices related to building and deploying containerized applications in Azure, critical decisions around this, and other aspects of the solution, including ways to lift-and-shift parts of the application to reduce applications changes.

By the end of this design session, you will be better able to design solutions that target Azure Kubernetes Service (AKS) and define a DevOps workflow for containerized applications.

### Hands-on Lab

This hands-on lab is designed to guide you through the process of building and deploying Docker images to the Kubernetes platform hosted on Azure Kubernetes Services (AKS), in addition to learning how to work with dynamic service discovery, service scale-out, and high-availability.

At the end of this lab, you will be better able to build and deploy containerized applications to Azure Kubernetes Service and perform common DevOps procedures.

## Azure services and related products

- Azure Kubernetes Service (AKS)
- Azure Container Registry
- Azure DevOps
- Docker
- Cosmos DB (including MongoDB API)

## Azure solutions

App Modernization

## Related references

- [MCW](https://github.com/Microsoft/MCW)

## Help & Support

We welcome feedback and comments from Microsoft SMEs & learning partners who deliver MCWs.  

***Having trouble?***

- First, verify you have followed all written lab instructions (including the Before the Hands-on lab document).
- Next, submit an issue with a detailed description of the problem.
- Do not submit pull requests. Our content authors will make all changes and submit pull requests for approval.

If you are planning to present a workshop, *review and test the materials early*! We recommend at least two weeks prior.

### Please allow 5 - 10 business days for review and resolution of issues.
-->

# クラウド ネイティブのアプリケーション

Fabrikam Medical Conferences は、医療コミュニティに特化したカンファレンス Web サイト サービスを提供している会社です。同社では、ビジネスが拡大しており、数多く存在するコード ベースのインスタンスとテナント別の変更サイクルを管理しきれなくなっていました。

このワークショップの目的は、管理性の高いプロセスへとコードを移行する概念実証 (PoC) をサポートすることにあります。移行先のプロセスでは、テナント コードのコンテナー化や、高品質な DevOps ワークフローの実現、データベース バックエンドのシンプルな移行などを扱います。

2020 年 2 月

## 対象となるお客様

- アプリケーション開発者
- インフラストラクチャ アーキテクト

## 要約

### ワークショップ

このワークショップでは、オンプレミスの既存のアプリケーションをコンテナーベースのアプリケーションへと移行する概念実証 (PoC) を実施します。この PoC では、Linux のノードで Azure Kubernetes Service (AKS) と Docker コンテナーを利用するマルチテナントの Web アプリ ホスティング ソリューションを実現するほか、MongoDB から CosmosDB への移行を行います。

このワークショップを終了すると、実証を重ねてきた DevOps の実践を通じて、コンテナーベース アプリケーションの信頼性を高められるようになり、そのアプリケーションのリリースの頻度を増やすことができるようになります。

### ホワイトボード設計セッション

このホワイトボード設計セッションでは、コンテナー化されたアプリケーションを Azure で開発、展開する方法を複数学習するほか、これらのいずれかを選択する際の重要なポイントについて学びます。また、アプリケーションの一部を移行してアプリケーションの変更頻度を減らす方法など、ソリューションの他の側面についても学習します。

この設計セッションを終了すると、Azure Kubernetes Service (AKS) をターゲットにしたソリューションを設計するスキルや、コンテナー化されたアプリケーション用の DevOps ワークフローを定義するスキルを習得できます。

### ハンズオン ラボ

このハンズオン ラボの目的は、Azure Kubernetes Service (AKS) にホストされた Kubernetes プラットフォームに Docker のイメージをビルドおよび展開する手順を説明することや、サービスの動的な検出、サービスのスケールアウト、高可用性の実現方法を順を追って解説することにあります。

このラボを終了すると、コンテナー化されたアプリケーションを Azure Kubernetes Service にビルドおよび展開することや、一般的な DevOps の手順を実行することができるようになります。

## Azure のサービスと関連製品

- Azure Kubernetes Service (AKS)
- Azure Container Registry
- Azure DevOps
- Docker
- Cosmos DB (MongoDB API を含む)

## Azure のソリューション

アプリの最新化

## 関連資料

- [MCW (英語)](https://github.com/Microsoft/MCW)

## ヘルプとサポート

MCW を提供されているマイクロソフトの SME パートナー様やラーニング パートナー様からのフィードバックやコメントをお待ちしています。  

***問題が発生した場合には***

- まずはじめに、ハンズオン ラボの事前セットアップ ガイドの内容を含め、ラボの指示書のすべての記述に従っていることを確認します。
- 次に、詳しい説明を添えて、問題の報告を行います。
- プル リクエストは送信しないでください。コンテンツの作成者が、変更作業をすべて完了してから、承認申請のプル リクエストを送信します。

ワークショップの開催を計画している場合は、*事前にワークショップの環境をチェックおよびテストしてください。*2 週間以上前に実施されることをお勧めします。

### 問題の確認と解決には、5 ~ 10 営業日がかかりますので、あらかじめご了承ください。
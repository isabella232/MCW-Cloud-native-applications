<!--
![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/master/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Cloud-native applications
</div>

<div class="MCWHeader2">
Whiteboard design session student guide
</div>

<div class="MCWHeader3">
February 2020
</div>

Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2020 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

-->
<!-- TOC -->
<!--

- [Cloud-native applications whiteboard design session student guide](#cloud-native-applications-whiteboard-design-session-student-guide)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Step 1: Review the customer case study](#step-1-review-the-customer-case-study)
    - [Customer situation](#customer-situation)
    - [Customer needs](#customer-needs)
    - [Customer objections](#customer-objections)
    - [Infographic for common scenarios](#infographic-for-common-scenarios)
  - [Step 2: Design a proof of concept solution](#step-2-design-a-proof-of-concept-solution)
  - [Step 3: Present the solution](#step-3-present-the-solution)
  - [Wrap-up](#wrap-up)
  - [Additional references](#additional-references)

-->
<!-- /TOC -->
<!--

# Cloud-native applications whiteboard design session student guide

## Abstract and learning objectives

In this whiteboard design session, you will learn about the choices related to building and deploying containerized applications in Azure, critical decisions around this, and other aspects of the solution, including ways to lift-and-shift parts of the application to reduce applications changes.

By the end of this design session you will be better able to design solutions that target Azure Kubernetes Service (AKS) and define a DevOps workflow for containerized applications.

## Step 1: Review the customer case study

**Outcome**

Analyze your customer's needs.

Timeframe: 15 minutes

Directions: With all participants in the session, the facilitator/SME presents an overview of the customer case study along with technical tips.

1. Meet your table participants and trainer.

2. Read all of the directions for steps 1-3 in the student guide.

3. As a table team, review the following customer case study.

### Customer situation

Fabrikam Medical Conferences provides conference web site services tailored to the medical community. They started out 10 years ago building a few conference sites for a small conference organizer. Since then, word of mouth has spread, and Fabrikam Medical Conferences is now a well-known industry brand. They now handle over 100 conferences per year and growing.

Medical conferences are typically low budget web sites as the conferences are usually between 100 to only 1500 attendees at the high end. At the same time, the conference owners have significant customization and change demands that require turnaround on a dime to the live sites. These changes can impact various aspects of the system from UI through to the back end, including conference registration and payment terms.

The VP of Engineering at Fabrikam, Arthur Block, has a team of 12 developers who handle all aspects of development, testing, deployment, and operational management of their customer sites. Due to customer demands, they have issues with the efficiency and reliability of their development and DevOps workflows.

The conference sites are currently hosted on-premises with the following topology and platform implementation:

- The conference web sites are built with the MEAN stack (Mongo, Express, Angular, Node.js).

- Web sites and APIs are hosted on Windows Server machines.

- MongoDB is also running on a separate cluster of Windows Server machines.

Customers are considered "tenants", and each tenant is treated as a unique deployment whereby the following happens:

- Each tenant has a database in the MongoDB cluster with its own collections.

- A copy of the most recent functional conference code base is taken and configured to point at the tenant database.

  - This includes a web site code base and an administrative site code base for entering conference content such as speakers, sessions, workshops, and sponsors.

- Modifications to support the customer's styles, graphics, layout, and other custom requests are applied.

- The conference owner is given access to the admin site to enter event details.

  - They will continue to use this admin site each conference, every year.

  - They have the ability to add new events and isolate speakers, sessions, workshops, and other details.

- The tenant's code (conference and admin web site) is deployed to a specific group of load balanced Windows Server machines dedicated to one or more tenant. Each group of machines hosts a specific set of tenants, and this is distributed according to scale requirements of the tenant.

- Once the conference site is live, the inevitable requests for changes to the web site pages, styles, registration requirements, and any number of custom requests begin.

Arthur is painfully aware that this small business, which evolved into something bigger, has organically grown into what should be a fully multi-tenanted application suite for conferences. However, the team is having difficulty approaching this goal. They are constantly updating the code base for each tenant and doing their best to merge improvements into a core code base they can use to spin up new conferences. The pace of change is fast, the budget is tight, and they simply do not have time to stop and restructure the core code base to support all the flexibility customers require.

Arthur is looking to take a step in this direction with the following goals in mind:

- Reduce regressions introduced in a single tenant when changes are made.

  - One of the issues with the code base is that it has many dependencies across features. Seemingly simple changes to an area of code introduce issues with layout, responsiveness, registration functionality, content refresh, and more.

  - To avoid this, he would like to rework the core code base so that registration, email notifications and templates, content and configuration are cleanly separated from each other and from the front end.

  - Ideally, changes to individual areas will no longer require a full regression test of the site; however, given the number of sites they manage, this is not tenable.

- Improve the DevOps lifecycle.

  - The time it takes to onboard a new tenant, launch a new site for an existing tenant, and manage all the live tenants throughout the lifecycle of the conference is highly inefficient.

  - By reducing the effort to onboard customers, manage deployed sites, and monitor health, the company can contain costs and overhead as they continue to grow. This may allow for time to improve the multi-tenant platform they would like to build for long-term growth.

- Increase visibility into system operations and health.

  - The team has little to no aggregate views of health across the web sites deployed.

While multi-tenancy is a goal for the code base, even with this in place, Arthur believes there will always be the need for custom copies of code for a particular tenant who requires a one-off custom implementation. Arthur feels that Docker containers may be a good solution to support their short-term DevOps and development agility needs, while also being the right direction once they reach a majority multi-tenant application solution.

### Customer needs

1. Reduce the overhead in time, complexity, and cost for deploying new conference tenants.

2. Improve the reliability of conference tenant updates.

3. Choose a suitable platform for their Docker container strategy on Azure. The platform choice should:

    - Make it easy to deploy and manage infrastructure.

    - Provide tooling to help them with monitoring and managing container health and security.

    - Make it easier to manage the variable scale requirements of the different tenants, so that they no longer have to allocate tenants to a specific load balanced set of machines.

    - Provide a vendor neutral solution so that a specific on-premises or cloud environment does not become a new dependency.

4. Migrate data from MongoDB on-premises to CosmosDB with the least change possible to the application code.

5. Continue to use Git repositories for source control and integrate into a CICD workflow.

6. Prefer a complete suite of operational management tools with:

    - UI for manual deployment and management during development and initial POC work.

    - APIs for integrated CICD automation.

    - Container scheduling and orchestration.

    - Health monitoring and alerts, visualizing status.

    - Container image scanning.

7. Complete an implementation of the proposed solution for a single tenant to train the team and perfect the process.

### Customer objections

1. There are many ways to deploy Docker containers on Azure. How do those options compare and what are motivations for each?

2. Is there an option in Azure that provides container orchestration platform features that are easy to manage and migrate to, that can also handle our scale and management workflow requirements?

### Infographic for common scenarios

_Kubernetes Architecture_

>**Note**: This diagram is an illustration of the Kubernetes topology, illustrating the master nodes managed by Azure, and the agent nodes where Customers can integrate and deploy applications.

![A diagram of Azure Kubernetes Service managed components with master and agent nodes.](media/azure-kubernetes-components.png)

<https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes>

_CICD to Azure Kubernetes Service with Azure DevOps_

![A diagram showing the Azure DevOps workflow to build Docker images from source code, push images to Azure Container Registry, and deploy to Azure Kubernetes Service.](media/azure-devops-aks.png)

<https://cloudblogs.microsoft.com/opensource/2018/11/27/tutorial-azure-devops-setup-cicd-pipeline-kubernetes-docker-helm/>

## Step 2: Design a proof of concept solution

**Outcome**

Design a solution and prepare to present the solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 60 minutes

**Business needs**

Directions: With all participants at your table, answer the following questions and list the answers on a flip chart:

1. Who should you present this solution to? Who is your target customer audience? Who are the decision makers?

2. What customer business needs do you need to address with your solution?

**Design**

Directions: With all participants at your table, respond to the following questions on a flip chart:

_High-level architecture_

1. Based on the customer situation, what containers would you propose as part of the new microservices architecture for a single conference tenant?

2. Without getting into the details (the following sections will address the particular details), diagram your initial vision of the container platform, the containers that should be deployed (for a single tenant), and the data tier.

_Choosing a container platform on Azure_

1. List the potential platform choices for deploying containers to Azure.

2. Which would you recommend and why?

3. Describe how the customer can provision their Azure Kubernetes Service (AKS) environment to get their POC started.

_Containers, discovery, and load balancing_

1. Describe the high-level manual steps developers will follow for building images and running containers on Azure Kubernetes Service (AKS) as they build their POC. Include the following components in the summary:

    - The Git repository containing their source.

    - Docker image registry.

    - Steps to build Docker images and push to the registry.

    - Run containers using the Kubernetes dashboard.

2. What options does the customer have for a Docker image registry and container scanning, and what would you recommend?

3. How will the customer configure web site containers so that they are reachable publicly at port 80/443 from Azure Kubernetes Service (AKS)?

4. Explain how Azure Kubernetes Service (AKS) can route requests to multiple web site containers hosted on the same node at port 80/443

_Scalability considerations_

1. Explain to the customer how Azure Kubernetes Service (AKS) and their preconfigured Scale Sets support cluster auto-scaling.

_Automating DevOps workflows_

1. Describe how Azure DevOps can help the customer automate their continuous integration and deployment workflows and the Azure Kubernetes Service (AKS) infrastructure.

2. Describe the recommended approach for keeping Azure Kubernetes Service (AKS) nodes up to date with the latest security patches or supported Kubernetes versions.

**Prepare**

Directions: With all participants at your table:

1. Identify any customer needs that are not addressed with the proposed solution.

2. Identify the benefits of your solution.

3. Determine how you will respond to the customer's objections.

Prepare a 15-minute chalk-talk style presentation to the customer.

## Step 3: Present the solution

**Outcome**

Present a solution to the target customer audience in a 15-minute chalk-talk format.

Timeframe: 30 minutes

**Presentation**

Directions:

1. Pair with another table.

2. One table is the Microsoft team and the other table is the customer.

3. The Microsoft team presents their proposed solution to the customer.

4. The customer makes one of the objections from the list of objections.

5. The Microsoft team responds to the objection.

6. The customer team gives feedback to the Microsoft team.

7. Tables switch roles and repeat Steps 2-6.

## Wrap-up

Timeframe: 15 minutes

Directions: Tables reconvene with the larger group to hear the facilitator/SME share the preferred solution for the case study.

## Additional references

|                                 |                                                                                                  |
| ------------------------------- | :----------------------------------------------------------------------------------------------- |
| **Description**                 | **Links**                                                                                        |
| Azure Kubernetes Services (AKS) | <https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes/>                                   |
| Kubernetes                      | <https://kubernetes.io/docs/home/>                                                               |
| AKS FAQ                         | <https://docs.microsoft.com/en-us/azure/aks/faq>                                                   |
| Autoscaling AKS                 | <https://github.com/kubernetes/autoscaler>                                                         |
| AKS Cluster Autoscaler          | <https://docs.microsoft.com/en-us/azure/aks/cluster-autoscaler>                                    |
| Upgrading an AKS cluster        | <https://docs.microsoft.com/en-us/azure/aks/upgrade-cluster>                                       |
| Azure Pipelines                 | <https://docs.microsoft.com/en-us/azure/devops/pipelines/>                                       |
| Container Security              | <https://docs.microsoft.com/en-us/azure/container-instances/container-instances-image-security/> |
| Image Quarantine                | <https://github.com/Azure/acr/tree/master/docs/preview/quarantine/>                              |
| Container Monitoring Solution   | <https://docs.microsoft.com/en-us/azure/azure-monitor/insights/containers>                       |
-->

![Microsoft Cloud Workshop](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/master/Media/ms-cloud-workshop.png "Microsoft Cloud Workshop")

<div class="MCWHeader1">
クラウド ネイティブ アプリケーション
</div>

<div class="MCWHeader2">
ホワイトボード設計セッション生徒用ガイド
</div>

<div class="MCWHeader3">
2020 年 2 月
</div>

このドキュメントに記載されている情報 (URL や他のインターネット Web サイト参照を含む) は、将来予告なしに変更することがあります。別途記載されていない場合、このソフトウェアおよび関連するドキュメントで使用している会社、組織、製品、ドメイン名、電子メール アドレス、ロゴ、人物、場所、出来事などの名称は架空のものです。実在する商品名、団体名、個人名などとは一切関係ありません。お客様ご自身の責任において、適用されるすべての著作権関連法規に従ったご使用をお願いいたします。著作権法による制限に関係なく、マイクロソフトの書面による許可なしに、このドキュメントの一部または全部を複製したり、検索システムに保存または登録したり、別の形式に変換したりすることは、手段、目的を問わず禁じられています。ここでいう手段とは、複写や記録など、電子的、または物理的なすべての手段を含みます。

マイクロソフトは、このドキュメントに記載されている内容に関し、特許、特許申請、商標、著作権、またはその他の無体財産権を有する場合があります。別途マイクロソフトのライセンス契約上に明示の規定のない限り、このドキュメントはこれらの特許、商標、著作権、またはその他の知的財産権に関する権利をお客様に許諾するものではありません。

製造元名、製品名、URL は、情報提供のみを目的としており、これらの製造元またはマイクロソフトのテクノロジを搭載した製品の使用について、マイクロソフトは、明示的、黙示的、または法令によるいかなる表明も保証もいたしません。製造元または製品に対する言及は、マイクロソフトが当該製造元または製品を推奨していることを示唆するものではありません。掲載されているリンクは、外部サイトへのものである場合があります。これらのサイトはマイクロソフトの管理下にあるものではなく、リンク先のサイトのコンテンツ、リンク先のサイトに含まれているリンク、または当該サイトの変更や更新について、マイクロソフトは一切責任を負いません。リンク先のサイトから受信した Web キャストまたはその他の形式での通信について、マイクロソフトは責任を負いません。マイクロソフトは受講者の便宜を図る目的でのみ、これらのリンクを提供します。また、リンクの掲載は、マイクロソフトが当該サイトまたは当該サイトに掲載されている製品を推奨していることを示唆するものではありません。

© 2020 Microsoft Corporation. All rights reserved.

Microsoft および <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> (英語) に掲載されているその他の商標は、マイクロソフト グループ各社の商標です。その他すべての商標は、その所有者に帰属します。

**目次**

<!-- TOC -->

- [クラウド ネイティブ アプリケーションホワイトボード設計セッション生徒用ガイド](#クラウド-ネイティブ-アプリケーションホワイトボード設計セッション生徒用ガイド)
  - [概要と学習の目的](#概要と学習の目的)
  - [ステップ 1: 顧客事例の確認](#ステップ-1:-顧客事例の確認)
    - [顧客の状況](#顧客の状況)
    - [顧客のニーズ](#顧客のニーズ)
    - [顧客の反論](#顧客の反論)
    - [一般的なシナリオのインフォグラフィック](#一般的なシナリオのインフォグラフィック)
  - [ステップ 2: 概念実証ソリューションの設計](#ステップ-2:-概念実証ソリューションの設計)
  - [ステップ 3: ソリューションのプレゼンテーション](#ステップ-3:-ソリューションのプレゼンテーション)
  - [まとめ](#まとめ)
  - [参考資料](#参考資料)

<!-- /TOC -->

# クラウド ネイティブ アプリケーションホワイトボード設計セッション生徒用ガイド<a name="クラウド-ネイティブ-アプリケーションホワイトボード設計セッション生徒用ガイド"></a>

## 概要と学習の目的<a name="概要と学習の目的"></a>

このホワイトボード設計セッションでは、Azure でコンテナー化アプリケーションを構築およびデプロイする方法の選び方とそれに関する重要な決定事項、アプリケーションの一部をクラウドに移行してアプリケーションの変更を削減する方法などのソリューションに関することを学びます。

この基礎設計セッションを修了すると、Azure Kubernetes Service (AKS) 向けソリューションの設計やコンテナー化アプリケーションの DevOps ワークフローの定義のスキルが向上します。

## ステップ 1: 顧客事例の確認<a name="ステップ-1:-顧客事例の確認"></a>

**成果**

顧客のニーズを分析する。

時間: 15 分

指示: セッション参加者全員が集まり、進行役または SME が顧客事例の概要と技術的なヒントを提示します。

1. 自班の参加者とトレーナーが集まります。

2. 生徒用ガイドのステップ 1 ～ 3 の指示をすべて読みます。

3. 班全体で下記の顧客事例を確認します。

### 顧客の状況<a name="顧客の状況"></a>

Fabrikam Medical Conferences では、医療コミュニティ向けにカスタマイズされた会議 Web サイト サービスを提供しています。同社は 10 年前、小規模な会議運営者に向けて会議サイトを複数構築しました。その後、Fabrikam Medical Conferences のブランドは口コミで業界に広まりました。現在では年間 100 回以上の会議を扱い、その数はさらに増加しています。

通常、医療関連の会議は参加者数が 100 名からせいぜい 1,500 名程度で、Web サイトの予算も少額です。同時に、会議運営者からは大幅なカスタマイズや稼働中のサイトへの応答時間を極小にする変更などが求められます。このような変更は、会議の登録や支払い条件など、UI からバックエンドまでシステムにさまざまな影響を与えます。

Fabrikam のエンジニアリング担当バイス プレジデントを務める Arthur Block は開発者 12 名のチームを所有しており、このチームで顧客サイトの開発、テスト、デプロイメント、運用管理をすべて担当しています。顧客の要望により、チームは開発および DevOps のワークフローの効率と信頼性に関する問題を抱えています。

現在、会議サイトは以下のテクノロジとプラットフォームが実装されたオンプレミス環境でホストされています。

- MEAN スタック (Mongo、Express、Angular、Node.js) で構築された会議 Web サイト

-  Windows Server マシンでホストされている Web サイトと API

- 独立した Windows Server マシン クラスターで実行されている MongoDB

顧客は「テナント」と見なされます。各テナントは以下のような独立したデプロイメントとして扱われます。

- 各テナントの MongoDB クラスターに、自身のコレクションを有するデータベースが存在します。

- 使用可能な最新の会議サイト コード ベースが取得され、テナント データベースを指定するように構成されます。

  - これには、Web サイトのコード ベースと、講演者、セッション、ワークショップ、スポンサーなどの会議に関するコンテンツを入力する管理サイトのコード ベースが含まれます。

- 変更を加えてスタイル、グラフィック、レイアウトなどの顧客の要望に対応することができます。

- 会議運営者は、管理サイトにアクセスしてイベントの詳細を入力できます。

  - 各会議の管理サイトは、毎年継続的に使用されます。

  - 新規イベントを追加したり、講演者、セッション、ワークショップなどの詳細を分離したりできます。

- テナントのコード (会議用および管理用の Web サイト) は、特定の Windows Server マシン グループにデプロイされます。このグループは負荷分散が構成されていて、1 つ以上のテナントで占用されます。各マシン グループでは特定セットのテナントがホストされ、テナントのスケーリング要件に基づいて分散されます。

- 会議サイトが実際に使用され始めると、Web サイトのページ、スタイル、登録要件、その他あらゆるカスタマイズの要望が生まれることは避けられません。

Arthur Block は、小規模だったビジネスが成長し、完全なマルチテナント アプリケーション会議スイートへと根本的に変化していることを実感しています。しかし、チームはこの目標の達成に苦戦しています。チームでは、各テナントのコード ベースを常に更新しメインのコード ベースに改良をマージして、新しい会議をすばやく作成できるようにすることに全力で取り組んでいます。変更は急速に進められ予算も抑えられているため、いったん立ち止まってメインのコード ベースを再構築し、顧客の要件のすべてに柔軟に対応できるようにする時間はありません。

チームでは、以下の目標を念頭にこの指示の各ステップを進めていきます。

- 変更時に単一テナントで発生する回帰の減少

  - コード ベースに関する問題の 1 つに、機能間に多数の依存関係が存在することがあります。コードのある部分にちょっとした変更を加えたために、レイアウト、応答性、登録機能、内容の更新などの問題が発生することがあります。

  - これを防ぐため、メインのコード ベースを再構築して登録、電子メール通知やテンプレート、内容や構成を相互間およびフロント エンドから明確に独立させます。

  - 一部に変更を加えてもサイトの回帰テストを完全に行う必要がないようにするのが理想的ですが、管理対象のサイト数を考えると現実的ではありません。

- DevOps ライフサイクルの改善

  - 会議のライフサイクル全体において、新規テナントの実装、既存テナントでの新規サイトの立ち上げ、稼働中の全テナントの管理に要する時間は、大幅な効率低下につながっています。

  - 顧客の実装、デプロイしたサイトの管理、正常性の監視などの労力を削減すると、成長を続けながらコストやオーバーヘッドを抑えることができます。これにより、長期的な成長に対応できるようにマルチテナント プラットフォームを改良する時間が生まれます。

- システムの運用状況と正常性の可視性向上

  - デプロイした Web サイト全体の正常性を集約的に表示する機能がまったく実装されていないか、または不十分です。

コード ベースのマルチテナント化を目標として掲げていますが、これを実装したとしても、ワンオフのカスタマイズされた実装を必要とする特定のテナントに向けたカスタム コードが必要になることが予想されます。チームでは、短期的な DevOps とアジャイルな開発のニーズに応えるには、マルチテナント アプリケーション ソリューションとして主要な地位を占めている Docker コンテナーが適切であり、有力なソリューションになり得ると考えています。

### 顧客のニーズ<a name="顧客のニーズ"></a>

1. 新規会議テナントのデプロイに要する時間とコストを削減し、作業も簡素化する。

2. 会議テナントの更新の信頼性を向上する。

3. Azure での Docker コンテナー戦略に適したプラットフォームを選択する。以下の観点からプラットフォームを選択します。

    - インフラストラクチャのデプロイと管理が容易なこと。

    - コンテナーの正常性とセキュリティの監視や管理に使用するツールが提供されること。

    - 各種テナントのさまざまなスケーリング要件を管理しやすく、特定の負荷分散マシン セットにテナントを割り当てる必要がないこと。

    - ベンダー ニュートラルなソリューションが提供され、特定のオンプレミス環境やクラウド環境に依存しないこと。

4. 最小限のアプリケーション コード変更でオンプレミスの MongoDB から CosmosDB にデータを移行する。

5. ソース管理と CI/CD ワークフローへの統合には引き続き Git リポジトリを使用する。

6. 以下の機能を含む完全な運用管理ツール スイートを導入する。

    - 開発や初期の POC 段階の作業で手動によるデプロイや管理に使用する UI。

    - 統合型 CI/CD の自動化に使用する API。

    - コンテナーのスケジュール設定とオーケストレーション。

    - 正常性の監視とアラート生成、状態の可視化。

    - コンテナー イメージのスキャン。

7. 提案されたソリューションを単一テナントに実装し、チームのトレーニングを実施してプロセスを完遂させる。

### 顧客の反論<a name="顧客の反論"></a>

1. Azure に Docker コンテナーをデプロイする方法にはさまざまなものがある。これらをどのようにして比較し、それぞれのメリットを理解すればよいのか?

2. 管理や移行が容易なコンテナー オーケストレーション プラットフォーム機能を Azure で使用する方法はあるのか、また自社のスケーリング要件や管理ワークフローの要件に対応できるか?

### 一般的なシナリオのインフォグラフィック<a name="一般的なシナリオのインフォグラフィック"></a>

_Kubernetes アーキテクチャ_

>**注意**: この図は、Azure で管理されるマスター ノードと、顧客がアプリケーションの統合やデプロイを行うことができるエージェント ノードを含む Kubernetes トポロジを示したものです。

![マスター ノードとエージェント ノードを含む Azure Kubernetes Service で管理されるコンポーネントを示した図](media/azure-kubernetes-components.png)

<https://docs.microsoft.com/ja-jp/azure/aks/intro-kubernetes>

_Azure DevOps を使用した Azure Kubernetes Service への CI/CD_

![ソース コードからの Docker イメージの構築、Azure Container Registry へのイメージのプッシュ、Azure Kubernetes Service へのデプロイを含む Azure DevOps ワークフローを示した図](media/azure-devops-aks.png)

<https://cloudblogs.microsoft.com/opensource/2018/11/27/tutorial-azure-devops-setup-cicd-pipeline-kubernetes-docker-helm/> (英語)

## ステップ 2: 概念実証ソリューションの設計<a name="ステップ-2:-概念実証ソリューションの設計"></a>

**成果**

ソリューションを設計し、15 分の講義形式で提供先の顧客の担当者に行うソリューションのプレゼンテーションを準備する。

時間: 60 分

**ビジネス ニーズ**

指示: 班の参加者全員で以下の質問に回答し、フリップ チャートに回答の一覧を記載します。

1. ソリューションを提案する相手は? 提案先の顧客の担当者は? 意思決定者は?

2. このソリューションで解決が必要な顧客のビジネス ニーズは?

**設計**

指示: 班の参加者全員でフリップ チャートに記載された以下の質問に回答します。

_アーキテクチャの概要_

1. 顧客の状況に基づいて、単一の会議テナントに向けた新しいマイクロサービス アーキテクチャの一部として提案するコンテナーを選択します。

2. 詳細には触れずに (各種の詳細については後のセクションで扱います)、コンテナー プラットフォームの初期構想、(単一のテナントに) デプロイするコンテナー、データ層を図示します。

_Azure で使用するコンテナー プラットフォームの選択_

1. Azure にコンテナーをデプロイする際に考えられるプラットフォームを列挙します。

2. 推奨するプラットフォームとその理由を示します。

3. 顧客の Azure Kubernetes Service (AKS) 環境をプロビジョニングし POC を開始する方法について説明します。

_コンテナー、検出、負荷分散_

1. イメージの構築、および POC 構築時の Azure Kubernetes Service (AKS) でのコンテナー実行において開発者が手動で行う手順の概要を示します。概要には以下の項目を含めます。

    - ソースを格納する Git リポジトリ

    - Docker イメージ レジストリ

    - Docker イメージを構築しレジストリにプッシュする手順

    - Kubernetes ダッシュボードからコンテナーを実行する手順

2. Docker イメージ レジストリとコンテナー スキャンの方法のうち顧客が実行可能なものを検討し、推奨する方法を決定します。

3. Azure Kubernetes Service (AKS) からインターネットを通じてポート 80/443 経由でアクセスできるように Web サイトのコンテナーを構成する方法を検討します。

4. ポート 80/443 でホストされている同一ノードの複数の Web サイト コンテナーに Azure Kubernetes Service (AKS) の要求をルーティングできるようにする方法を説明します。

_スケーラビリティに関する考慮事項_

1. Azure Kubernetes Service (AKS) と事前構成済みの Scale Sets でクラスターの自動スケーリングをサポートする方法を顧客に説明します。

_DevOps ワークフローの自動化_

1. Azure DevOps が顧客の CI/CD ワークフローと Azure Kubernetes Service (AKS) インフラストラクチャの自動化にどのように貢献するかについて説明します。

2. Azure Kubernetes Service (AKS) ノードにセキュリティ修正プログラムやサポート対象のバージョンの Kubernetes を適用し最新状態に保つために推奨する方法について説明します。

**準備**

指示: 班の参加者全員と以下を行います。

1. 提案したソリューションでは解決されない顧客のニーズを把握します。

2. ソリューションのメリットを把握します。

3. 顧客の反論に対応する方法を検討します。

15 分の講義形式で顧客に行うソリューションのプレゼンテーションに向けて準備します。

## ステップ 3: ソリューションのプレゼンテーション<a name="ステップ-3:-ソリューションのプレゼンテーション"></a>

**成果**

15 分の講義形式で提供先の顧客の担当者にソリューションのプレゼンテーションを行う。

時間: 30 分

**プレゼンテーション**

指示:

1. 他の班と組みます。

2. 一方の班はマイクロソフト チームを、もう一方の班は顧客を担当します。

3. マイクロソフト チームは、提案するソリューションのプレゼンテーションを顧客に向けて行います。

4. 顧客側は、反論リストの中からいずれかの反論を行います。

5. マイクロソフト チームは反論に対応します。

6. 顧客側はマイクロソフト チームにフィードバックを提供します。

7. 役割を入れ替えてステップ 2 ～ 6 を繰り返します。

## まとめ<a name="まとめ"></a>

時間: 15 分

指示: 各班が集まり、進行役や SME が事例に適したソリューションを発表します。

## 参考資料<a name="参考資料"></a>

|                                 |                                                                                                  |
| ------------------------------- | :----------------------------------------------------------------------------------------------- |
| **説明**                 | **リンク**                                                                                        |
| Azure Kubernetes Services (AKS) | <https://docs.microsoft.com/ja-jp/azure/aks/intro-kubernetes>                                   |
| Kubernetes                       | <https://kubernetes.io/docs/home/> (英語)                                                               |
| AKS の FAQ                         | <https://docs.microsoft.com/ja-jp/azure/aks/faq>                                                   |
| AKS の自動スケーリング                | <https://github.com/kubernetes/autoscaler> (英語)                                                         |
| AKS クラスターの自動スケーリング機能          | <https://docs.microsoft.com/ja-jp/azure/aks/cluster-autoscaler>                                    |
| AKS クラスターのアップグレード        | <https://docs.microsoft.com/ja-jp/azure/aks/upgrade-cluster>                                       |
| Azure Pipelines                | <https://docs.microsoft.com/ja-jp/azure/devops/pipelines/?view=azure-devops> (英語)                                       |
| コンテナーのセキュリティ              | <https://docs.microsoft.com/ja-jp/azure/container-instances/container-instances-image-security> |
| イメージの検疫                | <https://github.com/Azure/acr/tree/master/docs/preview/quarantine/> (英語)                              |
| コンテナー監視ソリューション   | <https://docs.microsoft.com/ja-jp/azure/azure-monitor/insights/containers>                       |
<div id="about-page">

    <!-- header begin -->
    <header class="page-head">
        <div class="header-wrapper">
            <div class="container">
                <div class="row">
                    
                    <div class="col-md-12">

                        <ol class="breadcrumb">
                            <li><a href="/">英雄列表</a></li>
                            <li class="active">排名</li>
                        </ol> <!-- end of /.breadcrumb -->

                    </div>
                </div>
            </div> <!-- /.container -->
        </div> <!-- /.header-wrapper -->
    </header> <!-- /.page-head (header end) -->

    <div class="main-content">

        <!-- begin our story section -->

        <section class="bg-white story">
            <div class="container">
                <div class="headline text-center">
                    <div class="row">
                        <a href="/contact#contact"><uib-alert>若您有任何问题或建议，请点击此处联系我们！</uib-alert></a>
                        <div class="col-md-6 col-md-offset-3">
                            <h2 class="section-title">英雄排名</h2>
                        </div>
                    </div>
                </div> <!-- /.headline -->

                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <input ng-model="searchKeyword"  type="text" class="form-control"required="required" placeholder="输入英雄名">
                    </div>
                    <div class="col-md-10 col-md-offset-1" ng-repeat = "(key,tier) in tiers  | filter: searchKeyword">
                        {{::tier[key].tier}}
                        <p class="champion_tier_lane" ng-repeat = "lane in tier  | filter: searchKeyword">
                            {{::lane.lane}}: 
                            <span class="tier_champion" ng-repeat = "champion in lane.champions  | filter: searchKeyword">
                                <a href="/champion/{{::champion.eng_name}}">
                                    <img ng-src="assets/img/champ_img/{{::champion.eng_name}}.png" width="20px"
                                                          alt="{{::champion.alias}}">
                                    {{::champion.alias}}</a>
                                <span ng-show=" ! $last ">, </span>
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- end of our story section -->

    </div> <!-- end of /.main-content -->
</div>

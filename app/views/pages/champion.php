<div id="about-page">
    <!-- header begin -->
    <header class="page-head">
        <div class="header-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <ol class="breadcrumb">
                            <li><a href="/">英雄列表</a></li>
                            <li class="active">{{::champion.name}}</li>
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
                
                <div class="headline">
                    <div class="row">
                        <p class="text-center question-alert"><a href="/contact/#contact">若您有任何问题或建议，请点击此处联系我们！</a></p>
                        <div class="col-md-6">
                            <div class="champion_detail">
                                <img class="detail-img" ng-src="assets/img/champ_img/{{::champion.eng_name}}.png" alt="{{::champion.name}}">
                                <h2 class="detail-title">{{::champion.name}}</h2>
                                <h3 class="detail-title">{{::champion.alias}}</h3>
                                <h4 class="detail-title">{{::champion.tags}}</h4>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <h4>通用对战技巧：</h4>
                            <p ng-repeat = "tip in generalTips">{{tip.vote}}{{tip.tip}} - {{tip.author}}</p>
                        </div>
                    </div>
                </div> <!-- /.headline -->

                <div class="row">
                    <div class="col-md-10 col-md-offset-1 text-center">
                        <p class="story-description"></p>
                        <!-- /.story-description -->
                    </div>
                </div>
            </div>
        </section>
        <!-- end of our story section -->

         <!-- begin skill section -->
<!--
        <section class="bg-light-gray skill">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 champion-tabs">
                        <h2>背景故事</h2>
                        <p class="champion-description" ng-bind-html="::champion.description"></p>
                    </div>

                    <div class="col-md-5">
                        <div class="skill-level">
                            <p>攻击</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100" style="width: 88%;">
                                    88%
                                 </div>
                            </div>

                            <p>防御</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100" style="width: 98%;">
                                    98%
                                 </div>
                            </div>

                            <p>治疗</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
                                    75%
                                 </div>
                            </div>

                            <p>上手难度</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
                                    85%
                                 </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </section>
-->
        <!-- begin counter section -->
        <section class="bg-white story champion-counter">
            <div class="container">
                <div class="row">
                    <uib-tabset justified="true"> <!--TODO: justified or not? -->
                            <uib-tab heading="{{::type.type}}" ng-repeat="type in types" 
                                 ng-click ="::getCounters(champion.id,type.type)">
                                    <div class="champion-against col-md-6" ng-repeat="(key,counter_data) in counters">
                                        <table>
                                            <thead>{{::champion.name}} 的 {{key=="weak"?"爸爸":"儿子"}} 们:</thead>
                                            <tr ng-repeat="counter in counter_data | limitTo:totalDisplayed">
                                                <td><a href="/champion/{{::counter.eng_name}}">
                                                        <img ng-src="assets/img/champ_img/{{::counter.eng_name}}.png" 
                                                        class="counter-thumbnail" alt="{{::champion.name}}">
                                                    </a>
                                                </td>
                                                <td class="counter-name">
                                                    <a href="/champion/{{::counter.eng_name}}">{{::counter.champion_against}}</a>
                                                </td>
                                                <td><button class="btn btn-default vote-btn" ng-click="upvote(counter.id,champion.id,type.type)">
                                                    <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>{{::counter.upvote}}
                                                </button></td>
                                                <td><button class="btn btn-default vote-btn" ng-click="downvote(counter.id,champion.id,type.type)">
                                                    <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>{{::counter.downvote}}
                                                </button></td>
                                                <td>
                                                    <a href="/champion/tips/{{::key=='weak'? champion.eng_name:counter.eng_name}}/{{::key=='weak'? counter.eng_name:champion.eng_name}}">
                                                        <button ng-mouseenter="getTips(counter.champion_weak, counter.champion_strong)" 
                                                                uib-popover-template="TipPopover.templateUrl" popover-placement="left" 
                                                                popover-title="{{champion.name}} vs {{counter.champion_against}} 的技巧:" type="button" 
                                                                popover-trigger="mouseenter" class="btn btn-black vote-btn">{{counter.num_tips}} 技巧
                                                        </button>
                                                    </a>
                                                        <script type="text/ng-template" id="PopoverTipTemplate.html">
                                                            <div class="hoverTips" ng-repeat="tip in tips">{{tip.tip}}</div>
                                                            <div class="hoverSubmitTip">点击提交新的技巧！</div>
                                                        </script>
                                                </td>
                                            </tr>
                                            <tr><td colspan="3" style="display:block"><button ng-show="counter_data.length>5" class="btn btn-default home-btn" ng-click="loadMore()">显示更多</button></td></tr>
                                        </table>        
                                    </div>
                            </uib-tab>
                        
                      </uib-tabset>
 
                </div>
            </div>
        </section>


    </div> <!-- end of /.main-content -->
</div>

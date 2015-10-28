<div id="home-page">


    <div class="main-content">

        <!--  begin portfolio section  -->
        <section class="bg-light-gray">
            <div class="container">

                <div class="headline">
                    <div class="row">
                        <p class="text-center question-alert"><a href="/contact/#contact">若您有任何问题或建议，请点击此处联系我们！</a></p>
                        <div class="col-md-6">
                            <h2 class="section-title">英雄列表</h2>
                            <h4 class="section-sub-title">
                                点击英雄查看其克制及被克制的英雄和对战技巧
                            </h4> <!-- /.section-sub-title -->
                            <input ng-model="searchKeyword" name="name" type="text" class="form-control" id="name" required="required" placeholder="搜索英雄： 输入英雄名或别名（例如 火男，乌鸦 等）">
                        </div>
                    </div>
                </div> <!-- /.headline -->


                <div class="champion-item-list">
                    <div class="row"><!--TODO: returning error - infinite-scroll="loadMore()" infinite-scroll-distance="8" -->

                        <div class="col-md-2 col-sm-3 col-xs-4" ng-repeat="champion in champions | filter: searchKeyword | limitTo:totalDisplayed">
                            <div class="champion-item">
                                <div class="item-image">
                                    <a href="/champion/{{::champion.eng_name}}">
                                        <img ng-src="assets/img/champ_img/{{::champion.eng_name}}.png" class="img-responsive center-block" alt="{{::champion.name}}">
                                        <div><span><i class="fa fa-plus"></i></span></div>
                                    </a>
                                </div>

                                <div class="item-description">
                                    <div>
                                            <span class="item-name">{{::champion.alias}}</span>

                                    </div>
                                </div> <!-- end of /.item-description -->
                            </div> <!-- end of /.portfolio-item -->
                        </div>
                        <button ng-show="!searchKeyword" class="btn btn-default home-btn" ng-click="displayMore()">Load more</button>
                    </div>
                    
                </div> <!-- end of portfolio-item-list -->
                    
            </div>
        </section> 
        <!--   end of portfolio section  -->
                    
    </div> <!-- end of /.main-content -->
</div>

<!-- TODO: hoverdir not working with angularjs -->
<!-- script for portfolio section using hoverdirection -->



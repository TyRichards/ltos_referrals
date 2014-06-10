<div class="sharebox">

<h6><?php _e( 'Share This', 'percivale' ); ?></h6>

<div class="digg-button">
<script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like layout="box_count" show_faces="false" width="45"></fb:like>
</div>

<div class="tweet-button">
<script type="text/javascript" src="http://tweetmeme.com/i/scripts/button.js"></script>
</div>

<ul class="share-links">
<li class="tiny-stumble"><a href="http://stumbleupon.com/submit?url=<?php the_permalink() ?>&amp;amp;title=<?php echo urlencode(the_title('','', false)) ?>">StumbleUpon</a></li>
<li class="tiny-reddit"><a href="http://reddit.com/submit?url=<?php the_permalink() ?>&amp;amp;title=<?php echo urlencode(the_title('','', false)) ?>">Reddit</a></li>
<li class="tiny-facebook"><a href="http://facebook.com/share.php?u=<?php the_permalink() ?>&amp;amp;t=<?php echo urlencode(the_title('','', false)) ?>">Facebook</a></li>
</ul>

</div>
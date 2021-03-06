<% if $ObjectEmbed %>
    <figure class="panel-post-media has-embed">
        $ObjectEmbed

        <figcaption class="panel-post-media-caption panel-post-embed--details">
            <% if $ObjectURL && $Title %>
                <h5 class="panel-post-embed--title"><a href="$ObjectURL" target="_blank">$Title</a></h5>
            <% else_if $Title %>
                <h5 class="panel-post-embed--title">$Title</h5>
            <% else_if $ObjectName %>
                <h5 class="panel-post-embed--title">$ObjectName</h5>
            <% end_if %>

            <% if $ObjectDescription %>
                $ObjectDescription
            <% else_if $Description %>
                $Description
            <% end_if %>
        </figcaption>
    </figure>
<% else_if $CouponType %>
<figure class="panel-post-media has-offer">
    <% if $Picture %>
        <% if $ObjectURL %>
            <a href="$ObjectURL" target="_blank"><img src="$Picture" alt="$ObjectName" /></a>
        <% else %>
            <img src="$Picture" alt="$ObjectName" />
        <% end_if %>
    <% end_if %>

    <figcaption class="panel-post-media-caption panel-post-offer--details">
        <% if $ObjectURL && $Title %>
            <h5 class="panel-post-offer--title"><a href="$ObjectURL" target="_blank">$Title</a><% if $RedeemCode %> <span class="panel-post-offer--redeem-code">$RedeemCode</span><% end_if %></h5>
        <% else_if $Title %>
            <h5 class="panel-post-offer--title">$Title<% if $RedeemCode %> <span class="panel-post-offer--redeem-code">$RedeemCode</span><% end_if %></h5>
        <% else_if $RedeemCode %>
            <h5 class="panel-post-offer--redeem-code">$RedeemCode</h5>
        <% end_if %>
        <% if $Expires %><h6 class="panel-post-offer--expires<% if $Expires.InPast %> panel-post-offer--expired<% end_if %>">
            <% if $Expires.InPast %>
                <% _t('EXPIRED', 'Expired') %>
            <% else %>
                <% _t('EXPIRES', 'Expires') %> <time class="panel-post-offer--expires-time">$Expires.Full</time>
            <% end_if %>
        </h6><% end_if %>
        <% if $Expires.InFuture && $RedeemUrl %>
            <a class="btn btn-sm btn-default panel-post-offer--redeem-url" href="$RedeemUrl" target="_blank"><% _t('CLAIM_OFFER', 'Claim offer') %></a><% end_if %>
        <% if $Terms %>
            $Terms
        <% end_if %>
    </figcaption>
</figure>
<% else_if $Image || $HeroShot %>
<figure class="panel-post-media has-image">
    <% if $HeroShot %>
        <img src="$HeroShot.URL" alt="<% if $Title %>$Title<% else %>$ObjectName<% end_if %>" />
    <% else %>
		<img src="$Image.URL" alt="<% if $Title %>$Title<% else %>$ObjectName<% end_if %>" />
    <% end_if %>

	<figcaption class="panel-post-media-caption">
        <% if $ObjectURL && $ObjectName %>
			<h5><a href="$ObjectURL" target="_blank">$ObjectName</a></h5>
        <% else_if $ObjectName %>
			<h5>$ObjectName</h5>
        <% end_if %>
        <% if $HeroShot && $HeroShot.Description %><p>$HeroShot.Description</p><% end_if %>
        <% if $Image && $Image.Description %><p>$Image.Description</p><% end_if %>
	</figcaption>
</figure>
<% else_if $Picture %>
	<figure class="panel-post-media has-image">
        <% if $ObjectURL %>
			<a href="$ObjectURL" target="_blank"><img src="$Picture" alt="$ObjectName" /></a>
        <% else %>
			<img src="$Picture" alt="$ObjectName" />
        <% end_if %>

		<figcaption class="panel-post-media-caption">
            <% if $ObjectURL && $ObjectName %>
				<h5><a href="$ObjectURL" target="_blank">$ObjectName</a></h5>
            <% else_if $ObjectName %>
				<h5>$ObjectName</h5>
            <% end_if %>
            <% if $Description %><p>$Description</p><% end_if %>
		</figcaption>
	</figure>
<% else_if $ObjectURL %>
	<figure class="panel-post-media">
		<a href="$ObjectURL" target="_blank">$ObjectURL</a>

		<figcaption class="panel-post-media-caption">
            <% if $ObjectURL && $ObjectName %>
				<h6><a href="$ObjectURL" target="_blank">$ObjectName</a></h6>
            <% else_if $ObjectName %>
				<h6>$ObjectName</h6>
            <% end_if %>
            <% if $Description %><p>$Description</p><% end_if %>
		</figcaption>
	</figure>
<% else_if $Attachments %>
    <% loop $Attachments %>
		<figure class="panel-post-media">
            <% if $Picture %>
                <% if $Link %>
					<a href="$Link" target="_blank"><img src="$Picture" alt="$Link" /></a>
                <% else %>
					<img src="$Picture" alt="$Link" />
                <% end_if %>
            <% end_if %>

            <% if not $Picture %>
                <% if $Content %>
					<figcaption class="panel-post-media-caption">
                        $Content
					</figcaption>
                <% end_if %>
            <% end_if %>
		</figure>
    <% end_loop %>
<% else_if $StartTime || $EndTime %>
        <div class="panel-post-event">
            <% if $ObjectName %>
                <h5 class="panel-post-event--title">
                <% if $Link %>
                    <a href="$Link" target="_blank">$ObjectName</a>
                <% else %>
                    $ObjectName
                <% end_if %>
                </h5>
            <% end_if %>
            <% if $Venue %>
                <h5 class="panel-post-event--venue">
                    <label class="panel-post-event--venue-label">At </label>
                    <strong>
                    <% if $VenueLink %>
                        <a href="$VenueLink" target="_blank">$Venue</a>
                    <% else %>
                        $Venue
                    <% end_if %>
                    </strong>
                </h5>
            <% end_if %>

            $Description
        </div>
<% end_if %>
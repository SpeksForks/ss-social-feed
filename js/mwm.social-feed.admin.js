!function(e){e.entwine("ss",function(e){e(".cms-container").entwine({onaftersubmitform:function(e,t){this.redirectOnSocialFeedOauthRequest(t.xhr)},onafterstatechange:function(e,t){this.redirectOnSocialFeedOauthRequest(t.xhr)},redirectOnSocialFeedOauthRequest:function(e){e&&e.getResponseHeader("X-SocialFeed-RedirectForOauth")&&(window.location=e.getResponseHeader("X-SocialFeed-RedirectForOauth"))}})})}(jQuery);
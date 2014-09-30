module TrackingCookieFilter
    private
    def tracking_cookie
        cookies[:CTID] = {
            value: 'test2',
            http_only: true,
        } unless cookies[:CTID]
    end
end

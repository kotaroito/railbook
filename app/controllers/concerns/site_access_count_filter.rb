module SiteAccessCountFilter
    private
    def site_access_count
      session[:site_access_counter] = session[:site_access_counter].to_i + 1
    end
end

module ApplicationHelper
    def current_class?(test_path)
        return 'nav_active' if request.path == test_path
        ''
    end
end

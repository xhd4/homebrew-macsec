cask "filemonitor" do
    version "1.3.0"
    sha256 "0c2317ba192ec7f768a51787e7486f60a04ddee42071e9168af9b8454fe762b7"
  
    url "https://bitbucket.org/objective-see/deploy/downloads/FileMonitor_#{version}.zip",
        verified: "bitbucket.org/objective-see/"
    appcast "https://objective-see.com/products/changelogs/FileMonitor.txt"
    name "FileMonitor"
    desc "Leveraging Apple's new Endpoint Security Framework, this utility monitors file events (such as creation, modifications, and deletions) providing detailed information about such events."
    homepage "https://objective-see.com/products/utilities.html"
  
    depends_on macos: ">= :catalina"
  
    app "FileMonitor.app"

    postflight do
        system_command "ln",
                       args: ["-sf", "#{staged_path}/FileMonitor.app/Contents/MacOS/FileMonitor", "/usr/local/bin/fmon"]
    end

    uninstall delete: [
        "/usr/local/bin/fmon",
    ]
end
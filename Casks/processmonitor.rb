cask "processmonitor" do
    version "1.5.0"
    sha256 "6c5721def426de77bff61d672d076314d89fb6bad28969f3b15b9f8c87cbd591"
  
    url "https://bitbucket.org/objective-see/deploy/downloads/ProcessMonitor_#{version}.zip",
        verified: "bitbucket.org/objective-see/"
    appcast "https://objective-see.com/products/changelogs/ProcessMonitor.txt"
    name "ProcessMonitor"
    desc "Leveraging Apple's new Endpoint Security Framework, this utility monitors process creations and terminations, providing detailed information about such events."
    homepage "https://objective-see.com/products/utilities.html"
  
    depends_on macos: ">= :catalina"
  
    app "ProcessMonitor.app"

    postflight do
        system_command "ln",
                       args: ["-sf", "#{staged_path}/ProcessMonitor.app/Contents/MacOS/ProcessMonitor", "/usr/local/bin/psmon"]
    end

    uninstall delete: [
        "/usr/local/bin/psmon",
    ]
end
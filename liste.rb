java_path = "./SPICinemas-CI-Config/artifacts/"

while true
	if File.exist?(java_path + "restart.txt")
		puts "Deploying.."

		`cp #{java_path}/cinemas-api.jar" SPICinemas-API-Docker/artifacts/`

		`rm restart.txt`

		`(cd SPICinemas-API-Docker; docker-compose down -v; docker-compose up -d)`
	end
	sleep(5)
end

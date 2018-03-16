java_path = "./SPICinemas-CI-Config/artifacts/"
js_path = "./SPICinemas-CI-Config/static-assets/"

while true
	if File.exist?(java_path + "restart.txt")
		puts "Deploying API.."

		`cp #{java_path}/cinemas-api.jar SPICinemas-API-Docker/artifacts/`

		`rm #{java_path}/restart.txt`

		`(cd SPICinemas-API-Docker; docker-compose down -v; docker-compose up -d)`
	end

	if File.exist?(js_path + "restart.txt")
		puts "Deploying UI.."

		`cp -R #{js_path}/ SPICinemas-API-Docker/static-assets/`

		`rm #{js_path}/restart.txt`

		# `(cd SPICinemas-API-Docker; docker-compose down -v; docker-compose up -d)`
	end

	puts "==================="

	sleep(5)
end


build_container: Sen2AgriDistribution MACCS
	docker build -f Dockerfile -t sen2agri .

MACCS:
	unzip MACCS-site-CNES.zip -d MACCS
	tar xvf MACCS/*.tar
	find ./MACCS -exec touch {} \;

Sen2Agri-package-1.7.zip:
	wget "http://www.esa-sen2agri.org/wp-content/uploads/resources/software/Sen2Agri-package-1.7.zip"

Sen2AgriDistribution: Sen2Agri-package-1.7.zip
	unzip Sen2Agri-package-1.7.zip
	find ./Sen2AgriDistribution -exec touch {} \;

clean:
	rm Sen2Agri-package-1.7.zip
	rm -rf Sen2AgriDistribution
	rm -rf MACCS
	docker rmi sen2agri

all: build_container

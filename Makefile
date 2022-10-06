# Install oommf via spack. Using most recent spack version ("develop")
spack-develop:
	docker build -f Dockerfile -t oommf-spack --build-arg SPACK_VERSION=develop  .

# use particular released versions of spack
spack-latest:
	docker build -f Dockerfile --build-arg SPACK_VERSION=releases/latest \
	-t oommf-spack-latest .

spack-v0.18.0:
	docker build -f Dockerfile --build-arg SPACK_VERSION=v0.18.0 \
   -t oommf-spack-v0.18.0 .

spack-v0.18.1:
	docker build -f Dockerfile --build-arg SPACK_VERSION=v0.18.1 \
   -t oommf-spack-v0.18.1 .


run:
	docker run --rm -ti -v ${PWD}:/io oommf-spack 

.PHONY: oommf-spack-v0.18.1 run spack-v0.18.0 spack-latest spack-develop

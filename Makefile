build:
	sudo docker build -t opstree/pythonci .

run:
	sudo docker rm -f pythonci || true
	sudo docker run -itd --name pythonci -v ${PWD}:/root opstree/pythonci

python-makemigration-and-migrate:
	sudo docker exec -i pythonci bash -c "python3 manage.py makemigrations && python3 manage.py migrate"

test-environment:
	sudo docker exec -i pythonci bash -c "which python3"

test-coverage:
	sudo docker exec -i pythonci bash -c "python3 manage.py test && python3 -m pytest -s --cov=. --cov-report=html"

black-test:
	sudo docker exec -i pythonci bash -c "black manage.py && black django_testing_examples/settings.py && black django_testing_examples/test_settings.py && black django_testing_examples/urls.py && black django_testing_examples/wsgi.py"

security-issue:
	sudo docker exec -i pythonci bash -c "bandit manage.py && bandit django_testing_examples/settings.py && bandit django_testing_examples/test_settings.py && bandit django_testing_examples/urls.py && bandit django_testing_examples/wsgi.py"

pyflakes-analyzes:
	sudo docker exec -i pythonci bash -c "pyflakes manage.py && pyflakes django_testing_examples/settings.py && pyflakes django_testing_examples/test_settings.py && pyflakes django_testing_examples/urls.py && pyflakes django_testing_examples/wsgi.py"

unittest-nosetest:
	sudo docker exec -i pythonci bash -c "nosetests -v manage.py && nosetests -v django_testing_examples/settings.py && nosetests -v django_testing_examples/test_settings.py && nosetests -v django_testing_examples/urls.py && nosetests -v django_testing_examples/wsgi.py"

static-code-analysis:
	sudo docker exec -i pythonci bash -c "pylint manage.py && pylint django_testing_examples/settings.py && pylint django_testing_examples/test_settings.py && pylint django_testing_examples/urls.py && pylint django_testing_examples/wsgi.py"
node {
    def images = [
      '{{repo}}': [ dockerfile: 'Dockerfile' ],
    ]

    def scripts = [
      '{{repo}}': ['pre-commit-ci.sh']
    ]

    def pipelineFile = fileLoader.fromGit(
      'v2/pipeline',
      'git@github.com:TAKEALOT/jenkins-shared.git',
      'master',
      'takealot-github-user',
      ''
    )

    pipelineFile.pipeline('{{repo}}', images, scripts)
}

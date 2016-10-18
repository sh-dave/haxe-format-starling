let project = new Project('RuntimeExample');
project.addParameter('-resource sheets/test.xml@test-sheet');
project.addSources('../../Sources');
project.addSources('Sources');
resolve(project);

use 5.008008;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'DR::Pager',
    VERSION_FROM      => 'lib/DR/Pager.pm',
    PREREQ_PM         => {
            'Data::Page'                    => 0,
    },
    META_MERGE => {
        resources => {
            homepage   => 'https://github.com/dr-co/dr-pager',
            repository => 'git@github.com:dr-co/dr-pager.git',
            bugtracker => 'https://github.com/dr-co/dr-pager/issues',
        }
    },
    ABSTRACT_FROM  => 'lib/DR/Pager.pm',
    AUTHOR         => 'Dmitry E. Oboukhov <unera@debian.org>',
    LIBS              => [],
    DEFINE            => '',
    INC               => '-I.',
    OBJECT            => '$(O_FILES)',
    LICENSE           => 'artistic',
);


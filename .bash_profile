# Below are the user - defined aliases
#

alias ll='ls -l'
alias la='ls -la'
alias rv='ruby --version'
alias mods='cd ~/ops_puppet/modules/'
alias dev='cd ~/ops_puppet/'
alias docs='cd ~/Documents/'
alias printkey='echo OPSDLY-11904'
alias pics='cd ~/Pictures/'
alias pwl='pwd; ls;'
alias python='python3.3'
alias sc='cd ~/Documents/school/Dropbox/'
alias fkthis='sudo shutdown -h now'
alias chrome='open /Applications/Google\ Chrome.app'
alias adium='open /Applications/Adium.app'
alias outlook='open /Applications/Microsoft\ Office\ 2011/Microsoft\ Outlook.app'
alias word='open /Applications/Microsoft\ Office\ 2011/Microsoft\ Word.app'
alias lol='open /Applications/League\ of\ Legends.app'
alias minecraft='open /Applications/Minecraft.app'
alias safari='open /Applications/Safari.app'
alias vbox='open /Applications/VirtualBox.app'
alias textedit='open /Applications/TextEdit.app'
alias pref='open /Applications/System\ Preferences.app'
alias aventail='open /Applications/Aventail\ Connect.app'
alias calc='open /Applications/Calculator.app'
alias vlc='open /Applications/VLC.app'

alias vswag='vagrant up swag; vagrant destroy swag;'
alias vswagaws='vagrant up swag --provider=aws; vagrant destroy swag'

# User Defined f(x)'s
# Provide some nice utility to our shell :3

function gac { # Adds files to a git repository
  git add $1
  git commit -a -m "$2"
  git push
}

function mf {
  dev
  cd ./modules/pvops_$1/manifests/
}

function vprov_all {
  cd ~/edmunds_dev/manifests/
  mkdir -p logs

  list=('adora_suite' 'artifactory' 'auth' 'confluence' 'cron' 'crypt' 'flyway' 'ftp' 'jenkins' 'jira' 'kerberos' 'lsb' 'mdsuite' 'mediafusion' 'mfindex' 'network' 'newrelic' 'nfs' 'nis' 'nss' 'ntp' 'opennms' 'oracle' 'pam' 'passenger' 'passwd' 'pcs' 'php' 'riemann' 'roles' 'snmp' 'ssh' 'stash' 'sudo' 'tomcat' 'vagrant' 'vim' 'vnc' 'roles::ad_auth' 'roles::artifact_repo' 'roles::att_adora' 'roles::att_adora_adm' 'roles::att_adora_ams' 'roles::att_adora_cms' 'roles::att_adora_content' 'roles::att_adora_dbsync' 'roles::att_adora_download' 'roles::att_adora_oracle' 'roles::att_delivery_accounts' 'roles::att_windows_host' 'roles::bastion' 'roles::ec2_tools' 'roles::epel_yum' 'roles::linux_base' 'roles::logstash_agent' 'roles::mdsuite' 'roles::mf_index_app' 'roles::mf_rabbitmq' 'roles::mf_www' 'roles::pcs_web' 'roles::pubkey_users' 'roles::pvjira' 'roles::pvjira_legacy' 'roles::pvops_yum' 'roles::pvstash' 'roles::pvwiki' 'roles::s3cmd' 'roles::tts' 'roles::twonky_mf_app' 'roles::twonky_mf_dev' 'roles::www_beambrowser' 'roles::www_devsupport' 'roles::www_nodejs' 'roles::www_roku')

  for i in "${list[@]}"
  do
    echo "Deleting last two lines, moving to file called new_vagrant.pp"
    cat vagrant.pp | sed '$d' > buffer_vagrant.pp
    cat buffer_vagrant.pp | sed '$d' > new_vagrant.pp
    rm buffer_vagrant.pp
    echo "Success!"

    echo "Adding $i to new_vagrant.pp file..."
    echo "  include pvops_"$i >> new_vagrant.pp
    echo "}" >> new_vagrant.pp
    echo "Success!"

    echo "Replacing vagrant.pp file..."
    mv new_vagrant.pp vagrant.pp
    echo "Success!"

    echo "Provisioning the master node with mofidied vagrant.pp... This could take a while"
    vagrant provision master | tee ./logs/master_2_7_19_pvops_${i}.log
    echo "Success! Or failure! I don't know :D. Output logged to logs/master_2_7_22_pvops_$i"
  done

}

function diff_vprov {
  cd ~/edmunds_dev/manifests/logs
  
  list=('adora_suite' 'artifactory' 'auth' 'confluence' 'cron' 'crypt' 'flyway' 'ftp' 'jenkins' 'jira' 'kerberos' 'lsb' 'mdsuite' 'mediafusion' 'mfindex' 'network' 'newrelic' 'nfs' 'nis' 'nss' 'ntp' 'opennms' 'oracle' 'pam' 'passenger' 'passwd' 'pcs' 'php' 'riemann' 'roles' 'snmp' 'ssh' 'stash' 'sudo' 'tomcat' 'vagrant' 'vim' 'vnc' 'roles::ad_auth' 'roles::artifact_repo' 'roles::att_adora' 'roles::att_adora_adm' 'roles::att_adora_ams' 'roles::att_adora_cms' 'roles::att_adora_content' 'roles::att_adora_dbsync' 'roles::att_adora_download' 'roles::att_adora_oracle' 'roles::att_delivery_accounts' 'roles::att_windows_host' 'roles::bastion' 'roles::ec2_tools' 'roles::epel_yum' 'roles::linux_base' 'roles::logstash_agent' 'roles::mdsuite' 'roles::mf_index_app' 'roles::mf_rabbitmq' 'roles::mf_www' 'roles::pcs_web' 'roles::pubkey_users' 'roles::pvjira' 'roles::pvjira_legacy' 'roles::pvops_yum' 'roles::pvstash' 'roles::pvwiki' 'roles::s3cmd' 'roles::tts' 'roles::twonky_mf_app' 'roles::twonky_mf_dev' 'roles::www_beambrowser' 'roles::www_devsupport' 'roles::www_nodejs' 'roles::www_roku')

  rm ./diffs/2_7_19vs22
  for i in "${list[@]}"
  do
    echo "Diffing file $i... Please wait."
    echo $i >> ./diffs/2_7_19vs22
    diff ./2_7_19/master_2_7_19_pvops_$i.log ./2_7_22/master_2_7_22_pvops_$i.log | grep err | tee -a ./diffs/2_7_19vs22
  done
}

function mpf { # Navigates to the manifests directory of a given module
	cd ~/edmunds_dev/modules/pvops_$1/manifests/
}

function vsp { # Navigates to the manifests directory of a given module
	vim ~/edmunds_dev/modules/pvops_$1/spec/classes/$2_spec.rb
}

function vin { # Opens vim for editing the init.pp file of a given module
	vim ~/edmunds_dev/modules/pvops_$1/manifests/init.pp
}

function vpr { # Opens vim to edit the params.pp file of a given module
	vim ~/edmunds_dev/modules/pvops_$1/manifests/params.pp
}

function vcm { # Opens vim for editing a custom module name within a pvops module
	vim ~/edmunds_dev/modules/pvops_$1/manifests/$2.pp
}

function ccm { # Shows the contents of a custom pvops module
	cat ~/edmunds_dev/modules/pvops_$1/manifests/$2.pp
}

# New environment setting added by AccuRev on Tue May 28 09:20:46 PDT 2013 1.
# The unmodified version of this file is saved in /Users/Jordan/.bash_profile1846226298.
# Do NOT modify these lines; they are used to uninstall.
PATH="${PATH}:/Users/Jordan/Applications/AccuRev/bin"
export PATH
# End comments by InstallAnywhere on Tue May 28 09:20:46 PDT 2013 1.

# Setting PATH for Python 3.3
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
export PATH

Project     : ${project}
Environment : ${environment}

Enabled features:
%{ for f in features ~}
 - ${f}
%{ endfor ~}

Tags:
%{ for k, v in tags ~}
 ${k} = ${v}
%{ endfor ~}

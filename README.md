# cacao-tf-llama2
CACAO(Cloud Automation & Continuous Analysis Orchestration) is a project enabling cloud automation & continuous analysis orchestration on multi-cloud.
It allows user to import templates defined in various templating language(e.g. terraform, ansible, argo workflow) from any git hosting solution (e.g. Github, Gitlab);
and deploy it to a cloud provider (e.g. OpenStack, AWS, K8S).

This is CACAO formatted Terraform and Ansible meant to deploy instances with llama2 configured from [this article](https://towardsdatascience.com/running-llama-2-on-cpu-inference-for-document-q-a-3d636037a3d8) using [this repo](https://github.com/kennethleungty/Llama-2-Open-Source-LLM-CPU-Inference)  

More information about CACAO can be found [in this repo](https://gitlab.com/cyverse/cacao)

Once deployed through CACAO, you can immediately SSH to the instance and run the example query from [the article](https://towardsdatascience.com/running-llama-2-on-cpu-inference-for-document-q-a-3d636037a3d8):
```
python3 main.py "How much is the minimum guarantee payable by adidas?"
```


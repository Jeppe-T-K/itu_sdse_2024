# Week 7: Data and model versioning

## Overview

### Agenda

 * [08:15 – 09:00] – Follow-along exercises: Cookiecutter Data Science
 * [09:15 – 10:00] – Follow-along exercises: Continued
 * [10:15 – 11:00] – Lecture: MLOps in organisations
 * [11:15 – 12:00] – Lecture: MLOps stages

### Preparation

For the exercises:

* [Cookiecutter Data Science: Install](https://cookiecutter-data-science.drivendata.org/)
* [Cookiecutter Data Science: Opinions on structure](https://cookiecutter-data-science.drivendata.org/opinions/)
* [Cookiecutter Data Science: Using the template](https://cookiecutter-data-science.drivendata.org/using-the-template/)
* [Cookiecutter Data Science: Github repo](https://github.com/drivendataorg/cookiecutter-data-science)

For the lecture:

* [ML-Ops.org: Three levels of ML Software](https://ml-ops.org/content/three-levels-of-ml-software)
* [ML-Ops.org: End-to-End ML](https://ml-ops.org/content/end-to-end-ml-workflow)
* [Google & MLOps levels](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning)


### Notes

* The exercises will be a follow-along coding session, mainly using terminal/CLI
* Make sure to install Cookiecutter Data Science and test that the `ccds` command works for you.
* Slides uploaded to [learnit](https://learnit.itu.dk/course/view.php?id=3023571#section-7).

## Exercises

> [!NOTE]
> **Learning goals**
> <i>By the end of the exercises, we expect you to be able to do the following:</i>
> <ul>
> <li>Start a data science project with version control that follows the CCDS format</li>
> <li>Explain the motivation for the structure of a data science project</li>
> <li>Share your repo with others and work on the same code</li>

Whenever you start a coding project, there's always the question of how you will structure the code.

Where is the main entry point into the code? What util functions do you need to add? Which components does your project require?

There is obviously not _one_ correct way of doing it, and it very much depends on what kind of project you're building. A good starting point for that is [_Cookiecutter_](https://cookiecutter.readthedocs.io/en/stable/README.html), which is a tool that can help you set up various projects using whichever [template](https://www.cookiecutter.io/templates) that suits your purpose.


![Cookiecutter Data Science](https://cookiecutter-data-science.drivendata.org/ccds.png "Cookiecutter Data Science AI overlord logo")

For these exercises, we will use a specific template for Data Science, called [Cookiecutter Data Science](https://cookiecutter-data-science.drivendata.org/). This is not by any means the only way to structure a data science project, and we will in the subsequent lessons work on adding extra pieces to our project, but the template has [well-reasoned arguments](https://cookiecutter-data-science.drivendata.org/opinions/) as to why. But first let's get our hands dirty.



### Exercise 0: Installation

Make sure Cookiecutter Datascience is installed:
`pipx install cookiecutter-data-science`

Try running it with:
`ccds --version`

Does this command run and show a version number above 2.something? Great!

### Exercise 1: Start your DS project

Next we want to start using Cookiecutter with one of our projects. Let's be inspired by CCDS's documentation on [their homepage](https://cookiecutter-data-science.drivendata.org/using-the-template/):



1. <details> <summary> Initialise CCDS in directory </summary>
   In the terminal, run <code>ccds</code>

   <pre><i><u>Discuss in pairs what each option does</u></i></pre>
   </details>
   
2. <details> <summary> Initialise git in the repo</summary> 
   In the terminal, run <code>git init</code>
   </details>

3. <details> <summary>Inspect the structure of the resulting repo </summary>

   ```

   ├── LICENSE            <- Open-source license if one is chosen
   ├── Makefile           <- Makefile with convenience commands like `make data` or `make train`
   ├── README.md          <- The top-level README for developers using this project.
   ├── data
   │   ├── external       <- Data from third party sources.
   │   ├── interim        <- Intermediate data that has been transformed.
   │   ├── processed      <- The final, canonical data sets for modeling.
   │   └── raw            <- The original, immutable data dump.
   │
   ├── docs               <- A default mkdocs project; see www.mkdocs.org for details
   │
   ├── models             <- Trained and serialized models, model predictions, or model summaries
   │
   ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
   │                         the creator's initials, and a short `-` delimited description, e.g.
   │                         `1.0-jqp-initial-data-exploration`.
   │
   ├── pyproject.toml     <- Project configuration file with package metadata for 
   │                         {{ cookiecutter.module_name }} and configuration for tools like black
   │
   ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
   │
   ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
   │   └── figures        <- Generated graphics and figures to be used in reporting
   │
   ├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
   │                         generated with `pip freeze > requirements.txt`
   │
   ├── setup.cfg          <- Configuration file for flake8
   │
   └── {{ cookiecutter.module_name }}   <- Source code for use in this project.
      │
      ├── __init__.py             <- Makes {{ cookiecutter.module_name }} a Python module
      │
      ├── config.py               <- Store useful variables and configuration
      │
      ├── dataset.py              <- Scripts to download or generate data
      │
      ├── features.py             <- Code to create features for modeling
      │
      ├── modeling                
      │   ├── __init__.py 
      │   ├── predict.py          <- Code to run model inference with trained models          
      │   └── train.py            <- Code to train models
      │
      └── plots.py                <- Code to create visualizations   
   ```

   <pre><i><u>Discuss in pairs how this structure makes sense to you</u>

   <li>Do you understand where the ML code goes?</li>
   <li>What does each of the pre-generated files do?</li>
   <li>Any terms that you don't know what they mean?</li>
   <li>Any terms that you don't know what they mean?</li>
   <li>Etc...</li></i></pre>

   </details>

4. <details><summary>Start tracking new files with git</summary>
   <tt> git add .</tt>

   <tt> git commit -m "Initial DDCS commit"</tt>

   <pre><i><u>What does <code>git add .</code> do?</u></i>

  </details>

### Exercise 2: Interlude

Let's take a step back and reflect on what we have done so far.

[![Build Status](https://travis-ci.org/cdcrabtree/nomine.svg?branch=master)](https://travis-ci.org/cdcrabtree/varo) [![Build status](https://ci.appveyor.com/api/projects/status/github/cdcrabtree/varo?svg=true)](https://ci.appveyor.com/api/projects/status/github/cdcrabtree/)

**_varo is retired. Please use [`nomine`](https://github.com/cdcrabtree/nomine) instead._**

# varo: Functions to classify names based on gender.

Large social science literatures are devoted to the role of gender on a host of behaviors and circumstances. This means that researchers often want to know the gender of individuals. Not all pre-existing datasets contain this information, though. Even if reseachers do not have information about the ethnicity or nationality of individuals, though, they often know their names. Scholars can use these names to create hand-coded measures of gender, working from either name-gender lists or from their own naive priors. This can be extremely time consuming, though. Recent developments in machine learning make available more efficient approaches that can use names to probabilistically identify the gender of their bearers. These exciting advancments can potentially catalyze existing gender-realted research programs.

In order to classify names in bulk, however, researchers would need to write code to automatically query the application programming interface (API) of these programs. That could be a significant barrier to use, though, as many scholars likely lack the requisite programming experience. The `varo` package addresses that problem by providing a function that makes the task of quering one particular API trivally easy. `get_gender`, takes given and family names along with API keys, queries [NamSor](http://www.namsor.com/)'s API, and returns a data frame that contains a gender scale score for each name along with a binary male/female classification. This scale score ranges from -1 to 1, with higher values denoting more 'female' names.  See [NamSor](http://www.namsor.com/) for more information about its algorithm. Please note that 'NamSor' only allows up to 1000 API free requests per day.

## Package Installation
The latest development version (0.5.0) is on GitHub can be installed using devtools.

```
if(!require("ghit")){
    install.packages("ghit")
}
ghit::install_github("cdcrabtree/varo")
```

## Support or Contact
Please use the issue tracker for problems, questions, or feature requests. If you would rather email with questions or comments, you can contact [Charles Crabtree](mailto:ccrabtr@umich.edu) and he will try to address the issue.

If you would like to contribute to the package, that is great! We welcome pull requests and new developers.

## Future To Dos
- Allow users to specify country codes, which can help improve classification accuracy.

## Tests
Users and potential contributors can test the software with the example code provided in the documentation for each function.

## Thanks
Thanks to [Karl Broman](https://github.com/kbroman) and [Hadley Wickham](http://hadley.nz/) for providing excellent free guies to building R packages.

### References

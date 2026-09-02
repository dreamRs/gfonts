# Generate HTML tags used in examples

Generate HTML tags used in examples

## Usage

``` r
tag_example(class = NULL)
```

## Arguments

- class:

  Class of the main div.

## Value

HTML tags.

## Examples

``` r
tag_example()
#> <div>
#>   <blockquote>
#>     <p>&Eacute;coutez !</p>
#>     <p>Puisqu&rsquo;on allume les &eacute;toiles,</p>
#>     <p>C&rsquo;est qu&rsquo;elles sont &agrave; quelqu&rsquo;un n&eacute;cessaires ?</p>
#>     <p>C&rsquo;est que quelqu&rsquo;un d&eacute;sire qu&rsquo;elles soient ?</p>
#>     <br/>
#>     <p>Vladimir Ma&iuml;akovski &ndash; &Eacute;coutez !</p>
#>   </blockquote>
#>   <div>
#>     <div>
#>       <p>abcdefghijklmnopqrstuvwxyz</p>
#>       <p style="font-weight: bold;">abcdefghijklmnopqrstuvwxyz</p>
#>       <p style="font-style: italic;">abcdefghijklmnopqrstuvwxyz</p>
#>     </div>
#>     <div>
#>       <p>ABCDEFGHIJKLMNOPQRSTUVWXYZ</p>
#>       <p style="font-weight: bold;">ABCDEFGHIJKLMNOPQRSTUVWXYZ</p>
#>       <p style="font-style: italic;">ABCDEFGHIJKLMNOPQRSTUVWXYZ</p>
#>     </div>
#>   </div>
#> </div>
```

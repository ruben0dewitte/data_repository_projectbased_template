##############################################################
# Data preparation
##############################################################

# SETUP -------------------------------------------------------------------

# Load packages
library(tidyverse)
library(here) #easy file referencing, root is set at project root
library(flextable) #Output tables to word
library(huxtable) # Outupt tables

#Load global variables
load(here("output","globalvariables.Rdata"))

# Data analysis ------------------------------------------------------------

# Load data
x = readRDS(file=here("output","foreign_born.RDS"))

x = x %>%
  select(year = TIME, country, value = Value) 

#Focus on four European countries
target =  c("Belgium","France","Netherlands","Germany")
x = x %>%
  filter(country %in% target)

#Figure
fig_out = ggplot(data=x) +
  geom_line(mapping=aes(x=year,y=value,colour=country,linetype=country)) +
  theme_minimal() + 
  theme(panel.grid = element_blank(),axis.title.y=element_text(angle=0,vjust=0.5),legend.position="bottom") +
  ylab("% of population") +
  xlab("Year") +
  scale_color_manual(values=colorpalette) + 
  scale_linetype_manual(values=linetypes)
fig_out
ggsave(filename =here("output","figures","foreign_born.png"),plot=fig_out,width=14,height=6,units="cm")
rm(fig_out)

#Table
x = x %>%
  filter(year==2000) %>%
  select(-year)

x_table = as_hux(x) 
x_table[1,] = c("Country","Percentage")
x_table = x_table %>%
  set_align(row = 1, col = everywhere, "center") %>%
  set_bold(row = 1,col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_top_border(row=1,col=everywhere) %>%
  set_bottom_border(row=nrow(x_table),col=everywhere) %>%
  set_number_format(2) %>%
  set_caption("Population as a percentage of the total population for selected European countries in 2000") %>%
  set_label("tab_foreignpop_2000") 

# Export to LaTeX
x_table_tex = x_table %>%
  add_footnote("\\textbf{Source:} Author's calculations based on \\citep{oecd2022foreign}.") %>%
  set_escape_contents(row = nrow(x_table)+1,col=everywhere, FALSE) %>%
  set_number_format(row=nrow(x_table)+1,col=everywhere,0) 

cat(to_latex(x_table_tex),file=here("output","tables","foreign_born_2000.tex"))

# Export to Word
x_table_word = x_table %>%
  add_footnote("Source: Author's calculations based on (OECD, 2022).") %>%
  set_number_format(row=nrow(x_table)+1,col=everywhere,0) 

x_table_word = as_flextable(x_table_word)
save_as_docx(x_table_word, path = here("output","tables","foreign_born_2000.docx"))

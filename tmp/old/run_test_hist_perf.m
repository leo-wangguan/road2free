clc
close all

clear
load('ASTOCK.mat')

% 000001
Y2000 = [find_date_idx(AllDate, '2000-01-04'), find_date_idx(AllDate, '2000-12-29')];
Y2001 = [find_date_idx(AllDate, '2001-01-02'), find_date_idx(AllDate, '2001-12-31')];
Y2002 = [find_date_idx(AllDate, '2002-01-04'), find_date_idx(AllDate, '2002-12-31')];
Y2003 = [find_date_idx(AllDate, '2003-01-02'), find_date_idx(AllDate, '2003-12-31')];
Y2004 = [find_date_idx(AllDate, '2004-01-02'), find_date_idx(AllDate, '2004-12-31')];
Y2005 = [find_date_idx(AllDate, '2005-01-04'), find_date_idx(AllDate, '2005-12-30')];
Y2006 = [find_date_idx(AllDate, '2006-01-04'), find_date_idx(AllDate, '2006-12-29')];
Y2007 = [find_date_idx(AllDate, '2007-01-04'), find_date_idx(AllDate, '2007-12-28')];
Y2008 = [find_date_idx(AllDate, '2008-01-02'), find_date_idx(AllDate, '2008-12-31')];
Y2009 = [find_date_idx(AllDate, '2009-01-05'), find_date_idx(AllDate, '2009-12-31')];
Y2010 = [find_date_idx(AllDate, '2010-01-04'), find_date_idx(AllDate, '2010-12-31')];
Y2011 = [find_date_idx(AllDate, '2011-01-04'), find_date_idx(AllDate, '2011-12-30')];
Y2012 = [find_date_idx(AllDate, '2012-01-04'), find_date_idx(AllDate, '2012-12-31')];
Y2013 = [find_date_idx(AllDate, '2013-01-04'), find_date_idx(AllDate, '2013-12-31')];
Y2014 = [find_date_idx(AllDate, '2014-01-02'), find_date_idx(AllDate, '2014-12-31')];
Y2015 = [find_date_idx(AllDate, '2015-01-05'), 0];
GsqMa20 = [find_date_idx(AllDate, '2000-01-04'), find_date_idx(AllDate, '2012-11-9')];

Years = [Y2000; Y2001; Y2002; Y2003; Y2004; Y2005; Y2006; Y2007; ...
         Y2008; Y2009; Y2010; Y2011; Y2012; Y2013; Y2014; Y2015; ...
         GsqMa20];

for i = 1:length(Years)
    
    DayIntv = Years(i,:);
    Close  = get_data_intv(AllClose,  DayIntv);
    Before = get_data_intv(AllBefore, DayIntv);
    Date   = get_data_intv(AllDate,   DayIntv);
    Signal = find_ma_signal(AllClose, 5, DayIntv);
    
    SEPair = find_holding_start_end(Signal);
    Profit = calc_profit_within_start_end(SEPair, Close);
    disp(sum(Profit))
end

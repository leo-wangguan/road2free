clc
close all

clear
load('ASTOCK.mat')

AllData = table(flipud(AllDate),   ...
                flipud(AllClose),  ... 
                flipud(AllOpen),   ...
                flipud(AllHigh),   ...
                flipud(AllLow),    ...
                flipud(AllBefore), ...
                flipud(AllHand),   ...
                flipud(AllVol));

T2000 = {'2000-01-01', '2000-12-31'};
T2001 = {'2001-01-01', '2001-12-31'};
T2002 = {'2002-01-01', '2002-12-31'};
T2003 = {'2003-01-01', '2003-12-31'};
T2004 = {'2004-01-01', '2004-12-31'};
T2005 = {'2005-01-01', '2005-12-31'};
T2006 = {'2006-01-01', '2006-12-31'};
T2007 = {'2007-01-01', '2007-12-31'};
T2008 = {'2008-01-01', '2008-12-31'};
T2009 = {'2009-01-01', '2009-12-31'};
T2010 = {'2010-01-01', '2010-12-31'};
T2011 = {'2011-01-01', '2011-12-31'};
T2012 = {'2012-01-01', '2012-12-31'};
T2013 = {'2013-01-01', '2013-12-31'};
T2014 = {'2014-01-01', '2014-12-31'};
T2015 = {'2015-01-01', '2015-12-31'};
ToNow = {'2000-01-01', '2015-12-31'};

DatePair = [T2000; T2001; T2002; T2003; T2004; T2005; T2006; T2007; ...
            T2008; T2009; T2010; T2011; T2012; T2013; T2014; T2015; ...
            ToNow];

show_table(AllData, DatePair, @get_ma_signal,             {AllData, 20});
% show_table(AllData, DatePair, @get_ma_with_filter_signal, {AllData, 20});
% show_table(AllData, DatePair, @get_ma2_signal,            {AllData, 20, 10});
% show_table(AllData, DatePair, @get_macd_signal,           {AllData});
% show_table(AllData, DatePair, @get_extrem_signal,         {AllData, 20});

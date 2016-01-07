function CapNum = get_cap_num(Code)

    Total = do_get(Code, 'TotalStock');
    Float = do_get(Code, 'LiuTongA') - do_get(Code, 'GaoGuan');

    CapNum = [Total, Float(:,2)];

end

function CapNum = do_get(Code, Path)

    Api = 'http://vip.stock.finance.sina.com.cn/corp/go.php/vCI_StockStructureHistory/stockid/';
    Opt = weboptions('Timeout', 30);
    Src = webread([Api, Code, '/stocktype/', Path, '.phtml'], Opt);

    Date = regexp(Src, '<div align="center">(\d{4}-\d{2}-\d{2})</div>', 'tokens');
    Date = cellfun(@(x) yyyymmdd(datetime(x)), Date);

    Num  = regexp(Src, '<div align="center">(\d+?(\.\d+)?\w¹É)</div>', 'tokens');
    Num  = cellfun(@(x) str2double(regexprep(x, 'Íò¹É', '')) * 1e4, Num);

    CapNum = [Date' Num'];

end

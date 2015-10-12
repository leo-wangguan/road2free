function Flag = detect_swing(Close, Before, i, N)
    
    Pct = Close(i-N+1:i) ./ Before(i-N+1:i) - 1;
    
    Flag = ifelse(mean(Pct) < 1/100, true, false);
    
end


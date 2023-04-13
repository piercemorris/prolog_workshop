%% TODO: Deal with final band that has no upper threshold
calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, Tax) :-
    Value > LowerThreshold,
    !,
    UpperThresholdWithinBand is min(Value, UpperThreshold),
    TaxableAmount is UpperThresholdWithinBand - LowerThreshold,
    Tax is (TaxableAmount * PercentageTax)/100.

%% If the above rule fails, we want to record that the Tax is 0 as the band doesn't apply
calculateTax(_, _, _, _, 0).

%% No accumulator
calculateTax([], _, 0).
calculateTax([[LowerThreshold, UpperThreshold, PercentageTax]|RestOfBands], Value, TotalTax) :-
    calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, TaxForCurrentBand),
    calculateTax(RestOfBands, Value, TaxOfRestOfBands),
    TotalTax is TaxForCurrentBand + TaxOfRestOfBands.

%% TODO: With accumulator
calculateTaxAcc([], _, TotalTax, TotalTax).
calculateTaxAcc([[LowerThreshold, UpperThreshold, PercentageTax]|RestOfBands], Value, AccTax, TotalTax) :-
    calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, TaxForCurrentBand),
    NewAccTax is AccTax + TaxForCurrentBand,
    calculateTaxAcc(RestOfBands, Value, NewAccTax, TotalTax).

%% Wrappers
calculateTax(Value, Tax) :-
    calculateTax([[145000, 250000, 2], [250000, 325000, 5], [325000, 750000, 10], [750000, 1000000, 12]], Value, Tax).

calculateTaxAcc(Value, Tax) :-
    calculateTaxAcc([[145000, 250000, 2], [250000, 325000, 5], [325000, 750000, 10], [750000, 1000000, 12]], Value, 0, Tax).

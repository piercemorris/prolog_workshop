%% Do the actual tax calculation for a given tax band
%% TODO: Deal with final band that has no upper threshold
calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, Tax) :-
    Value > LowerThreshold,
    !,
    UpperThresholdWithinBand is min(Value, UpperThreshold),
    TaxableAmount is UpperThresholdWithinBand - LowerThreshold,
    Tax is (TaxableAmount * PercentageTax)/100.

%% If the above rule fails, we want to record that the Tax is 0 as the band doesn't apply
calculateTax(_, _, _, _, 0).

%% Use recursion to figure out tax for each tax band
%% If there are no tax bands, tax is 0
calculateTax([], _, 0).
%% If tax band doesn't apply, tax is 0 and we stop recursion through the rest of the bands
calculateTax([[LowerThreshold, _, _]|_], Value, 0) :-
    Value =< LowerThreshold,
    !.
calculateTax([[LowerThreshold, UpperThreshold, PercentageTax]|RestOfBands], Value, TotalTax) :-
    calculateTax(LowerThreshold, UpperThreshold, PercentageTax, Value, TaxForCurrentBand),
    calculateTax(RestOfBands, Value, TaxOfRestOfBands),
    TotalTax is TaxForCurrentBand + TaxOfRestOfBands.

%% Wrapper
calculateTax(Value, Tax) :-
    calculateTax([[145000, 250000, 2], [250000, 325000, 5], [325000, 750000, 10], [750000, 1000000, 12]], Value, Tax).
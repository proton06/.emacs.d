# -*- coding: utf-8 -*-
import myAnalyzer as ma


class Analyzer(ma.Analyzer):
    def __init__(self, keyword, groupKey, out=''):
        """
        parameters
        ----------
        keyword : str
            解析するファイルを指定する正規表現パターン
        groupKey : str
            グループ化する際の判別に使われる正規表現パターン
            解析するファイルが複数の場合に指定します．groupKey が除かれたファイル名が同じなら
            グループとしてまとめられ， analyze() メソッドに filename の list として渡されます
        out : str
            解析したファイルを出力するディレクトリのパス

        Note
        ----------
        正規表現パターンは row string(e.g. r'hogehoge\d+')での指定を推奨します
        """
        super().__init__(keyword=keyword, groupKey=groupKey, out=out)

    def analyze(self, filename):
        """
        ファイルを解析して解析結果を返します
        parameters
        ----------
        filename(s) : str or list str
            解析するファイル名(のリスト)

        returns
        ----------
        out : Outable または Outable の list

        note
        ----------
        Outable(myAnalyzer.Outable) には次のオブジェクトが用意されています．
        Outdf(df, name, **argds)
            parameters
            ----------
            df : pd.DataFrame
            name : str
            argds : dict
                pd.DataFrame.to_csv() に渡す引数の辞書

        OutFig(fig, name, **args)
            parameters
            ----------
            fig : plt.Figure または plt.axes
            name : str
            argds : dict
                plt.Figure.savefig() に渡す引数の辞書
        """
        return ma.Outable()



def main():
    analyzer = Analyzer()
    analyzer.execute(target='result', out='analyze')


if __name__ == '__main__':
    main()
